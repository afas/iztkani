class PaperImage < ActiveRecord::Base
  belongs_to :paper
  has_attached_file :image,
                    :styles => {
                        :slider => '240x400#',
                        :preview => '90x140#',
                        :gallery => '635x440>',
                        :zoom => '1200x1200>'
                    },
                    :default_url => '/images/blank.gif',
                    :url => '/paper_images/:id/:style_:basename.:extension'
end
