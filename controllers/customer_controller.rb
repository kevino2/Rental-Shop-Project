require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )

  get '/customers' do
    @customers = Customer.all()
    erb ( :"customers/index" )
  end

  get '/customers/new' do
    erb(:"customers/new")
  end

  get '/customers/:id' do
    @customers = Customer.find(params['id'].to_i)
    erb(:"customers/show")
  end

  post '/customers' do
    customer = Customer.new(params)
    customer.save
    redirect to("/customers")
  end

  get '/customers/:id/edit' do
    @customer = Customer.find(params['id'].to_i)
    erb(:"customers/edit")
  end

  post '/customers/:id/update' do
    @customers = Customer.new(params)
    @customers.update
  end

  post '/customers/:id' do
     id = params[:id]
     @customer = Customer.new(params)
     @customer.update()
     redirect ('/customers')
  end

  post '/customers/:id/delete' do
    customer = Customer.find(params[:id])
    customer.delete
    redirect to("/customers")
  end
