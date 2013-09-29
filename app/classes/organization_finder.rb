class OrganizationFinder

  def self.search_checkins_for_organizations(user_id)
    foursquare = FoursquareClient.new(user_id)
    checkins = foursquare.pull_checkins
    organizations = Set.new
    names = []
    checkins.each do |checkin|
      names << checkin.json["venue"]["name"]
    end
    names.each do |name|
      Organization.lookup_by_name(name).each do |org|
        organizations << org
      end
    end
    organizations.to_a
  end
end
