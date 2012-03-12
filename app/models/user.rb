class User < ActiveRecord::Base
  validates :username, :presence => true
#  validates :email, :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  # :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  devise :encryptable, :encryptor => :sha1

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :phone, :password, :password_confirmation
end
