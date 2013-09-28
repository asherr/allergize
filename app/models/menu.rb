class Menu < ActiveRecord::Base
  attr_accessible :name, :organization, :foods

  belongs_to :organization
  has_many :foods
end
