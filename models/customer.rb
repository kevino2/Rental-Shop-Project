require_relative('../db/sql_runner.rb')
class Customer

attr_accessor :name, :wallet
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @wallet = options['wallet']
  end


  def save
  sql = "INSERT INTO customers (
          name,
          wallet
          )
          VALUES ($1, $2) RETURNING *"
          values = [@name, @wallet]
          @id = SqlRunner.run(sql, values).first()['id']
  end

  def self.all()
          sql = "SELECT * FROM customers"
          results = SqlRunner.run( sql )
          return results.map { |cust| Customer.new( cust ) }
  end

  def self.find( id )
          sql = "SELECT * FROM customers
          WHERE id = $1"
          values = [id]
          results = SqlRunner.run( sql, values )
          return Customer.new( results.first )
  end

  def self.delete_all
          sql = "DELETE FROM customers"
          SqlRunner.run( sql )
  end

  def delete()
          sql = "DELETE FROM rentals
          WHERE id = $1"
          values = [@id]
          SqlRunner.run( sql, values )
  end

  def stock()
          sql = "SELECT s.* FROM stocks s
          INNER JOIN rentals r ON r.stock_id = s.id
          WHERE r.customer_id = $1"
          values = [@id]
          results = SqlRunner.run(sql, values)
          return results.map { |stock| Stock.new(stock) }
  end



end
