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

  get '/rentals/new' do
    @customers = Customer.all
    @stocks = Stock.all
    erb(:"rentals/new")
  end

  post '/rentals' do
    rental = Rental.new(params)
    rental.save

    item = Stock.find(params[:stock_id])
    item.rented = true
    item.stock_rented_true()
    # add bolean t or f calling method
    redirect to("/rentals")
  end

  get '/rentals/:id' do
    @rental = Rental.find(params['id'].to_i)
    erb(:"rentals/show")
  end

  post '/rentals/:id/delete' do
    rental = Rental.find(params[:id])

    stock_item = rental.stock()
    stock_item.stock_rented_true

    rental.delete()

    redirect to("/rentals")
  end

  get '/rentals/:id/edit' do
    @customers = Customer.all()
    @stocks = Stock.all()
    @rental = Rental.find(params['id'])
    erb(:"rentals/edit")
  end

  #
  # get '/customers/:id/edit' do
  #   @customer = Customer.find(params['id'].to_i)
  #   erb(:"customers/edit")
  # end

  post '/rentals/:id/update' do
    @rentals = Rental.new(params)
    @rentals.update
  end

  post '/rentals/:id' do
     id = params[:id]
     @rental = Rental.new(params)
     @rental.update()
     redirect ('/rentals')
  end

  post '/rentals/:id/delete' do
    rental = Rental.find(params[:id])
    rental.delete
    redirect to("/rentals")
  end
