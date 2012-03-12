class CreatePaperImages < ActiveRecord::Migration
  def self.up
    create_table :paper_images do |t|
      t.integer :paper_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
    add_index :paper_images, :paper_id
  end

  def self.down
    drop_table :paper_images
  end
end
