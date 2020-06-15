class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images
  belongs_to :brand
  belongs_to :category
  has_many :images, dependent: :destroy
  # belongs_to_active_hash :prefecture
  # belongs_to_active_hash :category
  # belongs_to_active_hash :brand
end