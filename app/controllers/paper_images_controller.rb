class PaperImagesController < ApplicationController
  layout false
#  load_and_authorize_resource
  def destroy
    @paper_image = PaperImage.find(params[:id])
    @paper_image.destroy
  end

  def update_position
    if signed_in?
      paper_image = PaperImage.find(params[:id])
      paper_image.update_attributes(
          {:left => params[:left],
           :top => params[:top]
          })

      render :text => 'ok'
    else
      render :text => 'fail'
    end
  end

end
