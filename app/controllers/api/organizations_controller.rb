class Api::OrganizationsController < Api::ApiController
  def search
    @organization = Organization.lookup_by_name(params[:name])
    render json: @organization
  end
end