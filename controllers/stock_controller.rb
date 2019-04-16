require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stock' do
  @stocks = Stock.all()
  erb ( :"stocks/index" )
end

get '/stocks/new' do
  erb(:"stocks/new")
end

get '/stock/:id' do
  @stocks = Stock.find(params['id'].to_i)
  erb(:"stocks/show")
end

post '/stock' do
  stock = Stock.new(params)
  stock.save
  redirect to("/stock")
end

get '/stock/:id/edit' do
  @stock = Stock.find(params['id'].to_i)
  erb(:"stocks/edit")
end

post '/stocks/:id/update' do
  @stocks = stock.new(params)
  @stocks.update
end
