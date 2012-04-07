class Paper < ActiveRecord::Base
  @@per_page = 5
  cattr_reader :per_page

  has_attached_file :preview,
                    :styles => {
                        :list => '121x121#'
                    },
                    :url => "/paper/:id/:basename_:style.:extension"

  acts_as_textiled :description

  validates :title, :presence => true
  validates :short_description, :presence => true
  validates :description, :presence => true

  has_many :paper_images

  def index_images
    PaperImage.where("paper_id = #{id} and to_index = ?", true)
  end

  def paper_images=(paper_images_array)
    paper_images_array.each do |paper_image|
      self.paper_images << PaperImage.new(:image => paper_image)
    end
  end

  def update_to_index(to_index)
    if !to_index.nil?
      to_index.each do |paper_image_id, value|
        paper_image = PaperImage.find(paper_image_id)
        paper_image.to_index = value
        paper_image.save
      end
    end
  end


end
