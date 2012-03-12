class CartItem
  attr_reader :product, :quantity

  def initialize product
    @product = product
    @quantity = 1
  end

  def increment_quantity
    @quantity += 1
  end

  def decrement_quantity
    @quantity -= 1
  end

  def title
    @product.name
  end

  def price
    @product.price * @quantity
  end

  def url
    [@product.sub_category.category, @product.sub_category, @product]
  end
end
