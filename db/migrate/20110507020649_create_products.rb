class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :sub_category_id, :null => false
      t.string :name, :null => false
      t.text :description
      t.float :price, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
