class FoursquareClient
  attr_accessor :client_id, :client_secret

  def initialize(user_id)
    @foursquare = Foursquare::Base.new(User.find_by_id(user_id).foursquare_token)
    @user = @foursquare.users.find("self")
  end

  def self.authorize_url(callback)
    unauthed_client.authorize_url(callback)
  end

  def self.extract_token(code, callback)
    unauthed_client.access_token(code, callback)
  end

  def self.unauthed_client
    tokens = TOKENS["foursquare"]
    @@unauthed_client ||= Foursquare::Base.new(
      tokens["client_id"], tokens["client_secret"]
    )
  end

  def pull_checkins()
    @user.checkins
  end

  def search_checkins_for_organizations()
    checkins = pull_checkins

  end
end
