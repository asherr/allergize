class Organization < ActiveRecord::Base
  attr_accessible :name, :menus

  has_many :menus
  has_and_belongs_to_many :users

  validates :name, presence: true
  
  def self.lookup_by_name (name)
    Organization.where("similarity(name, '#{name}') > 0.1")
  end
end
