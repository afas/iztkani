class ProductImagesController < ApplicationController
  layout false
#  load_and_authorize_resource
  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
  end
end
