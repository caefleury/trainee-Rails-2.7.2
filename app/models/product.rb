class Product < ApplicationRecord
  belongs_to :tag
  validates :name,:description,:price,:tag_id, presence: true
  validates :name, uniqueness: true
  
  has_many :user_products, dependent: :destroy
  has_many :users, through: :user_products

  has_many_attached :articles
  has_many_attached :nutrients 
end
