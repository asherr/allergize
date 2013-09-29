class Api::MenusController < Api::ApiController

  def foods
    menu = Menu.find_by_id(params[:id])
    json = menu.foods.sort_by { |f| f.name }.map do |food|
      json = food.as_json
      json["assurances"] = food.assurances.sort_by { |a| a.name }
      json
    end

    render :json => json
  end

  def assurances
    menu = Menu.find_by_id(params[:id])
    json = menu.assurances.as_json
    json.each do |js|
      js["name"] = js["name"].titleize
    end
    render :json => json
  end
end
