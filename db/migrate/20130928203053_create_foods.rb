class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price
      t.text :ingredients

      t.belongs_to :menu

      t.timestamps
    end
  end
end
