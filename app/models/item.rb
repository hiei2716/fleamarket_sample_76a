class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images
  belongs_to :brand
  belongs_to :category
  has_many :images, dependent: :destroy
end
