require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller')
require_relative('controllers/stock_controller')
require_relative('controllers/rental_controller')

get '/' do
  erb( :index )
end
