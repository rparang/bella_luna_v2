class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :category
      t.text :description
      t.decimal :price_large
      t.decimal :price_small
      t.string :suggested_wine

      t.timestamps
    end
  end
end
