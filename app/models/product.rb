class Product < ApplicationRecord
  belongs_to :tag
  validates :name,:description,:price,:tag_id, presence: true
  validates :name, uniqueness: true
end
