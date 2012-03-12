class AddCoordinatesToPaperImages < ActiveRecord::Migration
  def self.up
    add_column :paper_images, :left, :float, :default => 0.0
    add_column :paper_images, :top, :float, :default => 0.0
    add_column :paper_images, :angle, :float, :default => 0.0
    add_column :paper_images, :width, :integer
    add_column :paper_images, :description, :text
  end

  def self.down
    remove_column :paper_images, :left
    remove_column :paper_images, :top
    remove_column :paper_images, :width
    remove_column :paper_images, :description
  end
end
