class Api::OrganizationsController < Api::ApiController
  def search
    organizations = Organization.lookup_by_name(params[:name])

    hash = organizations.map do |org|
      { :name => org.name, :id => org.id, :menus => org.menus }
    end

    render :json => hash
  end
end
