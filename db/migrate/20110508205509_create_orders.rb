class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name, :null => false
      t.string :phone, :null => false
      t.text :description
      t.float :total_price, :null => false
      t.boolean :complete, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
