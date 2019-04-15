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

stock1 = Stock.new({
  "stock_item" => "kilt",
  "size" => "Small",
  "product_image" => "/images/blue_douglas.jpg"
})

stock1.save()

stock2 = Stock.new({
  "stock_item" => "kilt",
  "size" => "Medium",
  "product_image" => "/images/rob_roy.jpg"
})

stock2.save()
stock3 = Stock.new({
  "stock_item" => "kilt",
  "size" => "Large",
  "product_image" => "/images/black_stewart.jpg"
})

stock3.save()

rental1 = Rental.new({
  "customer_id" => customer1.id,
  "stock_id" => stock1.id
})
rental1.save()
