require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stock' do
  @stocks = Stock.all()
  erb ( :"stocks/index" )
end

get '/stock/:id' do
  @stocks = Stock.find(params['id'].to_i)
  erb(:"stocks/show")
end
