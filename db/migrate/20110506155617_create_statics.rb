class CreateStatics < ActiveRecord::Migration
  def self.up
    create_table :statics do |t|
      t.string :title, :null => false
      t.string :url_part
      t.text :content_text
      t.boolean :has_a_file, :default => false
      t.string :file_link_title
      t.boolean :can_edit_url, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :statics
  end
end
