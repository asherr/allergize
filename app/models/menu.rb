class Menu < ActiveRecord::Base
  attr_accessible :name, :organization, :foods

  belongs_to :organization
  has_many :foods

  validates :name, presence: true 

  def frequency_can_eat(assurance_ids)
    can_eat = []
    foods.each do |food|
      food_assurance_ids = food.assurances.map(&:id)
      if (assurance_ids & food_assurance_ids).size == assurance_ids.size
        can_eat << food 
      end
    end
    can_eat.size
  end

  def percent_can_eat(assurance_ids)
    frequency_can_eat / foods.size
  end

  def assurances
    set = Set.new
    foods.each do |food|
      food.assurances.each do |assurance|
        set << assurances
      end
    end
    set.to_a
  end

end
