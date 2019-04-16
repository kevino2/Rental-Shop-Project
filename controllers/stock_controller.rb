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

get '/stocks/:id' do
  @stocks = Stock.find(params['id'].to_i)
  erb(:"stocks/show")
end

post '/stock' do
  stock = Stock.new(params)
  stock.save
  redirect to("/stock")
end

get '/stocks/:id/edit' do
  @stock = Stock.find(params['id'].to_i)
  erb(:"stocks/edit")
end

post '/stocks/:id/update' do
  @stocks = stock.new(params)
  @stocks.update
end

post '/stocks/:id' do
   id = params[:id]
   @stock = Stock.new(params)
   @stock.update()
   redirect ('/stock')
end

post '/stocks/:id/delete' do
  stock = Stock.find(params[:id])
  stock.delete
  redirect to("/stock")
end
