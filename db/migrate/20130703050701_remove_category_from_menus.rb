class RemoveCategoryFromMenus < ActiveRecord::Migration
  def up
    remove_column :menus, :category
      end

  def down
    add_column :menus, :category, :string
  end
end
