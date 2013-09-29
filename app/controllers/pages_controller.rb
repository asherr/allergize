class PagesController < ApplicationController
  def home
  end

  def landing_page
    render "landing_page", :layout => "landing_page"
  end
end
