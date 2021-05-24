# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
products = Product.create([ {id: 2, company: "1", title: "title1", popularity: 4, price: "10", imageString: "shop_08.jpg", category: "women", description: "this is product 1"}, 
                            {id: 3, company: "2", title: "title2", popularity: 10, price: "20", imageString: "shop_09.jpg", category: "women", description: "this is product 2"}])

ProductVariant.destroy_all
product_variants = ProductVariant.create([  {product_id: 2, colour: "Red", size: "s", quantity: 5},
                                            {product_id: 2, colour: "Blue", size: "s", quantity: 8},
                                            {product_id: 2, colour: "Black", size: "xl", quantity: 4},
                                            {product_id: 2, colour: "Green", size: "l", quantity: 9},
                                            {product_id: 3, colour: "Red", size: "s", quantity: 1},
                                            {product_id: 3, colour: "Red", size: "m", quantity: 3},
                                            {product_id: 3, colour: "Red", size: "l", quantity: 4},
                                            {product_id: 3, colour: "Green", size: "xl", quantity: 13},
                                            {product_id: 3, colour: "Black", size: "xl", quantity: 2}])