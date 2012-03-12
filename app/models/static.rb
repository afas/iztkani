class Static < ActiveRecord::Base

  acts_as_textiled :content_text

  has_attached_file :image,
                    :styles => {
                        :default => '635x635>',
                    },
                    :url => "/files/:id/:basename_:style.:extension"
  has_attached_file :file, :url => "/files/:id/:basename.:extension"

  validates :title, :presence => true
  validates :content_text, :presence => true
end
