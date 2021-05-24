# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
products = Product.create([ {id: 1, company: "1", title: "Yoga outfit", popularity: 61, price: "40.00", imageString: "shop_08.jpg", category: "women", description: "this is product 1"}, 
                            {id: 2, company: "2", title: "Top", popularity: 22, price: "35.55", imageString: "shop_09.jpg", category: "women", description: "this is product 2"},
                            {id: 3, company: "3", title: "Jeans", popularity: 38, price: "59.99", imageString: "shop_10.jpg", category: "men", description: "jeans is product 3"},
                            {id: 4, company: "4", title: "Jacket", popularity: 69, price: "129.99", imageString: "shop_11.jpg", category: "men", description: "jacket is product 4"},
                            {id: 5, company: "5", title: "Skirt", popularity: 88, price: "16.99", imageString: "shop_12.jpg", category: "kids", description: "skirt is product 5"}])

ProductVariant.destroy_all
product_variants = ProductVariant.create([  {product_id: 1, colour: "Red", size: "s", quantity: 5},
                                            {product_id: 1, colour: "Blue", size: "s", quantity: 8},
                                            {product_id: 1, colour: "Black", size: "xl", quantity: 4},
                                            {product_id: 1, colour: "Green", size: "l", quantity: 9},
                                            {product_id: 2, colour: "Red", size: "s", quantity: 1},
                                            {product_id: 2, colour: "Red", size: "m", quantity: 3},
                                            {product_id: 2, colour: "Red", size: "l", quantity: 4},
                                            {product_id: 2, colour: "Green", size: "xl", quantity: 13},
                                            {product_id: 2, colour: "Black", size: "xl", quantity: 2},
                                            {product_id: 3, colour: "Red", size: "s", quantity: 5},
                                            {product_id: 3, colour: "Blue", size: "s", quantity: 8},
                                            {product_id: 3, colour: "Black", size: "xl", quantity: 4},
                                            {product_id: 3, colour: "Green", size: "l", quantity: 9},
                                            {product_id: 4, colour: "Red", size: "s", quantity: 1},
                                            {product_id: 4, colour: "Red", size: "m", quantity: 3},
                                            {product_id: 4, colour: "Red", size: "l", quantity: 4},
                                            {product_id: 4, colour: "Green", size: "xl", quantity: 13},
                                            {product_id: 4, colour: "Black", size: "xl", quantity: 2},
                                            {product_id: 5, colour: "Black", size: "xl", quantity: 4},
                                            {product_id: 5, colour: "Green", size: "l", quantity: 9},
                                            {product_id: 5, colour: "Red", size: "s", quantity: 1},
                                            {product_id: 5, colour: "Blue", size: "s", quantity: 8},
                                            {product_id: 5, colour: "Black", size: "xl", quantity: 4},
                                            {product_id: 5, colour: "Green", size: "l", quantity: 9},
                                            {product_id: 5, colour: "Red", size: "s", quantity: 1}])
                                            
    User.destroy_all
    User.create({id: 1, firstName: "RAD", lastName: "RAD", email: "rad2021rmit@gmail.com", password: "Rails2021", password_confirmation: "Rails2021"})