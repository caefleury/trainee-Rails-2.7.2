class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,:name,:price,:articles_url,:nutrients_url

  has_one :tag
  has_many :users

  def articles_url
    if object.articles.attached?
      array = []
      object.articles.each do |article|
        array.append rails_blob_path(article, only_path: true)
      end  
    end
    array
  end
  def nutrients_url
    if object.nutrients.attached?
      array = []
      object.nutrients.each do |nutrient|
        array.append rails_blob_path(nutrient, only_path: true)
      end  
    end
    array
end
  

end
