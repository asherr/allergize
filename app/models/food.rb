class Food < ActiveRecord::Base
  attr_accessible :ingredients, :name, :price, :menu

  belongs_to :menu
end
