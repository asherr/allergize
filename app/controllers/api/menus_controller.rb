class Api::MenusController < Api::ApiController

  def show
    menu = Menu.find_by_id(params[:id])
    food = menu.foods
    hash = { "name" => menu.name, "foods" => food }
    render :json => hash
  end

end