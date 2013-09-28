class CreateAssurances < ActiveRecord::Migration
  def change
    create_table :assurances do |t|
      t.string :name

      t.timestamps
    end

    create_table :assurances_foods do |t|
      t.belongs_to :assurance
      t.belongs_to :food
    end

    create_table :assurances_users do |t|
      t.belongs_to :assurance
      t.belongs_to :user
    end
  end
end
