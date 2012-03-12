class AddDescriptionToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :description, :text
    add_column :sub_categories, :description, :text
  end

  def self.down
    remove_column :categories, :description
    remove_column :sub_categories, :description
  end
end
