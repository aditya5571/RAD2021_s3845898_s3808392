# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
products = Product.create([ {company: "1", title: "title1", size: "s", price: "10", imageString: "shop_08.jpg", category: "winter", description: "this is product 1"}, 
                            {company: "2", title: "title2", size: "s", price: "20", imageString: "shop_09.jpg", category: "winter", description: "this is product 2"}])