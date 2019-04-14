require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/customer.rb' )
require_relative( '../models/rental.rb' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

  get '/rentals' do
    @rentals = Rental.all
    erb ( :"rentals/index" )
  end

  get '/rentals/:id' do
    @rental = Rental.find(params['id'].to_i)
    erb(:"rentals/show")
  end

  get '/rentals/new' do
    @customers = Customer.all
    @stock = Stock.all
    erb(:"rentals/new")
  end

  post '/rentals' do
    rental = Rental.new(params)
    rental.save
    redirect to("/rentals")
  end

  post '/rentals/:id/delete' do
    Rental.delete(params[:id])
    redirect to("/rentals")
  end
