#encoding:utf-8
class AddDefaultStatics < ActiveRecord::Migration
  def self.up
    Static.create(:title => 'О нас', :content_text => 'О нас все такое', :url_part => 'about')
    Static.create(:title => 'Купить', :content_text => 'Накупите у нас кучу класных штук', :url_part => 'categories', :can_edit_url => false)
    Static.create(:title => 'Блог', :content_text => 'Блог все такое', :url_part => 'papers', :can_edit_url => false)
    Static.create(:title => 'Связь', :content_text => 'Контакты телефоны скайпы линки всетакое', :url_part => 'contacts')
  end

  def self.down
  end
end
