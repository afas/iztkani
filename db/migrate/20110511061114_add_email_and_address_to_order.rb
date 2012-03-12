class AddEmailAndAddressToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :email, :string
    add_column :orders, :address, :text
  end

  def self.down
    remove_column :orders, :email
    remove_column :orders, :address
  end
end
