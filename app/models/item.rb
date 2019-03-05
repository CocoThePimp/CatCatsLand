class Item < ApplicationRecord
  has_many :order_contents
  has_many :products through: :order_contents
  validates :image_url, presence: true #, uniqueness: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, length: { in: 20..100 }
end
