class Organization < ActiveRecord::Base
  attr_accessible :name, :menus

  has_many :menus
end
