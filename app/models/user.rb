class User < ApplicationRecord
  # after_create :cart
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy

  # def cart
  #   Cart.create(user_id: current_user.id)
  # end
end
