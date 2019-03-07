class User < ApplicationRecord

  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  after_create :cart

  def cart
    if Cart.find_by(user: self) == nil
      Cart.create(user: self)
    end
    puts "£" * 30 + "#{self}" + "£" * 30
  end
end
