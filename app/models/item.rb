class Item < ApplicationRecord
  has_many :users,  optional: true
  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to :category

  
end
