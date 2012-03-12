class WelcomeController < ApplicationController
  def index
    @papers = Paper.where("to_index = ?", true).order("id desc").limit(8)
    #@paper_images = Paper.index_images
    render :layout => 'index'
  end

  protected

  def static_id
    1
  end
end
