class Food < ActiveRecord::Base
  attr_accessible :ingredients, :name, :price, :menu

  has_and_belongs_to_many :assurances
  belongs_to :menu

  validates :name, presence: true
end
