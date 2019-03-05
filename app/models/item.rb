class Item < ApplicationRecord
  has_many :order_contents
  has_many :items, through: :order_contents
  has_one_attached :image_url
  validates :image_url, presence: true #, uniqueness: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, length: { in: 20..100 }

  has_many :join_table_cart_items
  has_many :carts, through: :join_table_cart_items

def image_url
  image_url.attach(params[:image_url])
end

end

