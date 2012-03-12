# encoding: utf-8
module SubCategoriesHelper
  def bread_crumbs
    sep = ' > '
    result = ''
    result << link_to('Каталог продукции', categories_path)
    result << sep << link_to(@category.title, category_sub_categories_path(@category))
    if @sub_category
      result << sep << link_to(@sub_category.title, category_sub_category_products_path(@category, @sub_category))
      if @product
        result << sep << link_to(@product.name, category_sub_category_product_path(@category, @sub_category, @product))
      end
    end
    result = raw result
    content_tag :div, result, :class => 'bread-crumbs'
  end
end
