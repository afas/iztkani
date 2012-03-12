class AddTiIndexToPaperImage < ActiveRecord::Migration
  def self.up
    add_column :paper_images, :to_index, :boolean
  end

  def self.down
    remove_column :paper_images, :to_index
  end
end
