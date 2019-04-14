require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stock' do
  @stock = stock.all()
  erb ( :"stocks/index" )
end

get '/stock/:id' do
  @stock = stock.find(params['id'].to_i)
  erb(:"stock/show")
end
