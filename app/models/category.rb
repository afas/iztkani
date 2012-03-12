class Category < ActiveRecord::Base
  before_destroy :delete_sub_categories

  has_many :sub_categories

  has_attached_file :image,
                    :styles => {
                        :list => '121x121#',
                        :default => '250x250>'
                    },
                    :url => "/category/:id/:basename_:style.:extension"

  validates :title, :presence => true
  validates :description, :presence => true

  acts_as_textiled :description

  default_scope order(:title)
  scope :not_empty, joins(:sub_categories).group(:category_id)
  scope :for_user, lambda { |signed| signed ? all : not_empty }

  private
  def delete_sub_categories
    SubCategory.where(:category_id => id).delete_all
  end

  def import_xls
  end

end
