class Category < ApplicationRecord
  before_validation do
    self.ancestry = nil if self.ancestry.blank?
  end
  validates :name, :ancestry, :id, presence: true
  has_ancestry
  has_many :items
end
