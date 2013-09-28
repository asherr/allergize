class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.belongs_to :organization

      t.timestamps
    end
  end
end
