class Product < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 8

  belongs_to :sub_category
  has_many :product_images

  has_attached_file :image,
                    :styles => {
                        :list => '121x121#'
                    },
                    :url => "/products/:id/:basename_:style.:extension"
  has_attached_file :file, :url => "/products/:id/:basename.:extension"

  validates :sub_category_id, :presence => true
  validates :name, :presence => true


  def product_images=(product_images_array)
    product_images_array.each do |product_image|
      self.product_images << ProductImage.new(:image => product_image)
    end
  end
end