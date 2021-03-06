class FoursquareController < ApplicationController
  def callback
    token = FoursquareClient.extract_token(params["code"], foursquare_callback_url)
    current_user.update_attribute(:foursquare_token, token)
    redirect_to root_path
  end
end
