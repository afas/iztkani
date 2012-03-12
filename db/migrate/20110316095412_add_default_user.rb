class AddDefaultUser < ActiveRecord::Migration
  def self.up
    delete_admin

    admin = User.create(:username => 'admin', :email => 'admin@nomail.net', :password => 'admin')
    admin.save
  end

  def self.down
    delete_admin
  end

  private

  def self.delete_admin
    admin = User.find_by_username('admin')
    admin.delete if admin
  end
end
