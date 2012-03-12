# encoding: utf-8
module ProductsHelper
  def product_price(price)
    parse_price(price, "руб.", "коп.")
  end

  def product_short_price(price)
    parse_price(price, "р.")
  end

  def product_image
    s_image = stuff_image
    if s_image
      image = image_tag s_image.url(:default)
      link_path = stuff_image_link_path
      link = link_to(image, link_path, :remote => true)
      content_tag :div, raw(link)
    end
  end

  MAX_WIDTH = 1070
  def product_big_image
    image_url = stuff_image.url(:original)
    image_file = stuff_image.to_file(:original)
    geometry = Paperclip::Geometry.from_file(image_file).to_s.split('x').map { |size| size.to_i }
    width = geometry[0] > MAX_WIDTH ? MAX_WIDTH : geometry[0]
    image_tag image_url, :width => width
  end

  private

  def parse_price(price, rub_symb, kop_symb = nil)
    rub = price.floor
    kop = ((price - rub) * 100).round
    result = ''
    if kop_symb
      result << "#{rub} #{rub_symb}" if rub > 0
      result << ' ' if rub > 0 && kop > 0
      result << "#{kop} #{kop_symb}" if kop > 0
    else
      result << "#{rub}"
      result << ",#{kop}" if kop > 0
      result << " #{rub_symb}"
    end
    result = "0 #{rub_symb}" if result == ''
    result
  end

  def stuff_image
    stuff = if @product && @product.image_file_name?
      @product
    elsif @sub_category && @sub_category.image_file_name?
      @sub_category
    elsif @category && @category.image_file_name?
      @category
    end
    stuff.image if stuff
  end

  def stuff_image_link_path
    if @product && @product.image_file_name?
      image_category_sub_category_product_path(@category, @sub_category, @product)
    elsif @sub_category && @sub_category.image_file_name?
      image_category_sub_category_path(@category, @sub_category)
    elsif @category && @category.image_file_name?
      image_category_path(@category)
    end
  end
end
