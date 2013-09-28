class Organization < ActiveRecord::Base
  attr_accessible :name, :menus

  has_many :menus
  has_and_belongs_to_many :users
end
