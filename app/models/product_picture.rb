class ProductPicture < ActiveRecord::Base
  mount_uploader :picture, ProductPictureUploader
  belongs_to :product

  validates :picture, presence: true

  before_save :update_picture_attributes


  def self.search_picture this_params
    product_picture = self.all
    product_picture = product_picture.joins(:product).where("products.name LIKE ?", "%#{this_params[:product_key]}%") if this_params[:product_key].present?
    product_picture.paginate(page: this_params[:page])
  end


  private
  
    def update_picture_attributes
      if picture.present? && picture_changed?
        self.picture_content_type = picture.file.content_type
        self.picture_file_size = picture.file.size
      end
    end
end
