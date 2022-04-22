# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create!(name:"Comida") #id=1
Tag.create!(name:"Bebida") #id=2
Tag.create!(name:"Roupa") #id=3


product_list = [
    ["Batata","chips", 11, 1],
    ["Frango","franguito", 23, 1],
    ["Whey","whey de ervilha", 230, 1],
    ["Pizza","pizza vegana", 60, 1],
    ["Fanta Guaraná","doce", 6, 2],
    ["Vodka","putin", 35, 2],
    ["Cerveja","pão", 12, 2],
    ["Calça","folgada", 120, 3],
    ["Camiseta","GG", 29, 3],
    ["Boné","com redinha", 90, 3],
]
  
product_list.each do |name, description, price, tag|
    Product.create!(name:name,description:description, price: price, tag_id:tag)
end