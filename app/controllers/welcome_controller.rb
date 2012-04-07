class WelcomeController < ApplicationController
  def index
    @paper = Paper.unscoped.where("to_index = ?", true).order("random()").first
    #@paper_images = Paper.index_images
    render :layout => 'index'
  end

  protected

  def static_id
    1
  end
end
