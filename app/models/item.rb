class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  # has_many :comments
  belongs_to :category

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to_active_hash :prefecture
  # belongs_to_active_hash :condition
  belongs_to_active_hash :brand
end
