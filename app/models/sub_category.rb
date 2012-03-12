class SubCategory < ActiveRecord::Base
  before_destroy :delete_products

  belongs_to :category
  has_many :products

  has_attached_file :image,
                    :styles => {
                        :list => '121x121#',
                        :default => '250x250>'
                    },
                    :url => "/sub_category/:id/:basename_:style.:extension"

  validates :category_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true

  acts_as_textiled :description

  default_scope order(:title)
  scope :not_empty, joins(:products).group(:sub_category_id)
  scope :for_user, lambda { |signed| signed ? all : not_empty }


  def self.sub_all
    Category.all.map do |category|
        SubCategory.where(:category_id => category.id)
    end
  end

  private
  def delete_products
    Product.where(:sub_category_id => id).delete_all
  end
end
