class Order < ActiveRecord::Base
  @@per_page = 20
  cattr_reader :per_page

  before_destroy :delete_all_line_items

  has_many :line_items

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :total_price, :presence => true
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end

  private
  def delete_all_line_items
    LineItem.where('order_id = ?', id).delete_all
  end

end

