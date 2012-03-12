class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, :except => [:index, :show, :image]
  before_filter :find_cart, :except => :destroy

  before_filter :build_left_menu

  private

  def build_left_menu
    @menu_categories = Category.all
    @menu_sub_categories = SubCategory.sub_all

    @like = Like.where("url = '#{request.request_uri}'").first
    if @like.nil?
      @like = Like.new
    end

  end

  def find_cart
    session[:cart] ||= Cart.new
    @cart = session[:cart]
  end

end
