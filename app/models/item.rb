class Item < ApplicationRecord
  validates :image_url, presence: true #, uniqueness: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, length: { in: 20..100 }

  has_many :join_table_cart_items
  has_many :carts, through: :join_table_cart_items
end
