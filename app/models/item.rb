class Item < ApplicationRecord
  validates :image_url, presence: true #, uniqueness: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, length: { in: 20..100 }
end
