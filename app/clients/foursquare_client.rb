class FoursquareClient
  attr_accessor :client_id, :client_secret

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
end
