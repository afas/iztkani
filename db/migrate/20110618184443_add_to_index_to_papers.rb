class AddToIndexToPapers < ActiveRecord::Migration
  def self.up
    add_column :papers, :to_index, :boolean
  end

  def self.down
    remove_column :papers, :to_index
  end
end
