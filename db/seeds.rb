require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require_relative( "../models/stock.rb" )
require("pry-byebug")

Rental.delete_all()
Customer.delete_all()
Stock.delete_all()

customer1 = Customer.new({
  "name" => "Hamish MacDonald",
  "wallet" => 100
})

customer1.save()

customer2 = Customer.new({
  "name" => "Walter Campbell",
  "wallet" => 200
})

customer2.save()

customer3 = Customer.new({
  "name" => "Strachan MacLachan",
  "wallet" => 200
})

customer3.save()

customer4 = Customer.new({
  "name" => "Badger McTadger",
  "wallet" => 100
})

customer4.save()

stock1 = Stock.new({
  "stock_item" => "Blue Douglas kilt",
  "size" => "Small",
  "product_image" => "/images/blue_douglas.jpg"
})

stock1.save()

stock2 = Stock.new({
  "stock_item" => "Rob Roy kilt",
  "size" => "Medium",
  "product_image" => "/images/rob_roy.jpg"
})

stock2.save()
stock3 = Stock.new({
  "stock_item" => "Black Stewart kilt",
  "size" => "Large",
  "product_image" => "/images/black_stewart.jpg"
})

stock3.save()

stock4 = Stock.new({
  "stock_item" => "MacLeod of Lewis",
  "size" => "Medium",
  "product_image" => "/images/macleod_of_lewis.jpg"
})

stock4.save()

stock5 = Stock.new({
  "stock_item" => "MacKenzie",
  "size" => "Medium",
  "product_image" => "/images/mackenzie.jpg"
})

stock5.save()

rental1 = Rental.new({
  "customer_id" => customer1.id,
  "stock_id" => stock1.id
})
rental1.save()
binding.pry
nil
