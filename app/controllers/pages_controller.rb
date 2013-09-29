class PagesController < ApplicationController
  def home
    @suggested_orgs = OrganizationFinder.search_checkins_for_organizations(current_user.id)
  end

  def landing_page
    render "landing_page", :layout => "landing_page"
  end
end
