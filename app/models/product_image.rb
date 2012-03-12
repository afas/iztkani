class ProductImage < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                        :preview => '90x140#',
                        :gallery => '635x440>',
                        :zoom => '1200x1200>'
                    },
                    :default_url => '/images/blank.gif',
                    :url => '/product_images/:id/:style_:basename.:extension'
end
