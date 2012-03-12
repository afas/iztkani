class CreateLineItem < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :order_id, :null => false
      t.integer :product_id, :null => false
      t.integer :quantity, :null => false
      t.float :total_price, :null => false
    end
  end

  def self.down
    drop_table :line_items
  end
end
