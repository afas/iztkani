module ApplicationHelper

  def title(before_title_text)
    content_for(:title) { before_title_text }
  end

  def main_menu_items
    Static.all.map do |static|
      item = [static.title, "/#{static.url_part}"]
      item << Category.for_user(current_user).map do |category|
        [category.title, category_sub_categories_path(category)]
      end if static.url_part == 'categories'
      item
    end
  end

  def hidden_div_if condition, attributes = {}, &block
    attributes[:style] = 'display: none' if condition
    content_tag 'div', attributes, &block
  end

  def show_contacts
    admin = User.find(1)
    phone = content_tag :div, admin.phone, :class => 'phone'
    mail = content_tag :div, link_to(admin.email, "mailto:#{admin.email}"), :class => 'mail'
    raw "#{phone}#{mail}"
  end
end
