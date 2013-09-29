class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @authorize_url = FoursquareClient.authorize_url(foursquare_callback_url)
    render "devise/registrations/edit"
  end
end
