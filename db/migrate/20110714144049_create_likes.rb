class CreateLikes < ActiveRecord::Migration
  def self.up
    create_table :likes do |t|
      t.string :url
      t.integer :count, :default => 0
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :likes
  end
end
