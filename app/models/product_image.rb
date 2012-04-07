class ProductImage < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                        :preview => '89x89>',
                        :gallery => '635x440>',
                        :zoom => '1400x1400>'
                    },
                    :default_url => '/images/blank.gif',
                    :url => '/product_images/:id/:style_:basename.:extension'
end
