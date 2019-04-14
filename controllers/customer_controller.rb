require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )

  get '/customers' do
    @customers = customer.all()
    erb ( :"customers/index" )
  end

  get '/customers/:id' do
    @customers = customer.find(params['id'].to_i)
    erb(:"customers/show")
  end
