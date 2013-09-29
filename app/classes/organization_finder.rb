class OrganizationFinder

  def self.search_checkins_for_organizations(user_id)
    foursquare = FoursquareClient.new(user_id)
    checkins = foursquare.pull_checkins
    organizations = []
    names = []
    checkins.each do |checkin|
      names << checkin.json["venue"]["name"]
    end
    binding.pry
    names.each do |name|
      organizations << Organization.lookup_by_name(name)
    end
    organizations
  end
end
