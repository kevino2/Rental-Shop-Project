require_relative('../db/sql_runner.rb')
class Rental

attr_accessor :customer_id, :stock_id
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
     # if options['id']
    @customer_id = options['customer_id']
    # .to_i
    @stock_id = options['stock_id']
    # .to_i
  end

  def save
     sql = "INSERT INTO rentals (
            customer_id,
            stock_id
            )
            VALUES ($1, $2) RETURNING id"
            values = [@customer_id, @stock_id]
            results = SqlRunner.run(sql, values)
            @id = results.first()['id'].to_i
   end

   def self.all()
           sql = "SELECT * FROM rentals"
           results = SqlRunner.run( sql )
           return results.map { |rental| Rental.new( rental ) }
   end

   def customer()
          sql = "SELECT * FROM customers
          WHERE id = $1"
          values = [@customer_id]
          results = SqlRunner.run( sql, values )
          return Customer.new( results.first )
   end

   def stock()
          sql = "SELECT * FROM stocks
          WHERE id = $1"
          values = [@stock_id]
          results = SqlRunner.run( sql, values )
          return Stock.new( results.first )
   end

   def self.delete_all()
          sql = "DELETE FROM rentals"
          SqlRunner.run( sql )
   end

   def delete()
          sql = "DELETE FROM rentals
          WHERE id = $1"
          values = [@id]
          SqlRunner.run( sql, values )
   end

   # def self.find_by_id(id)
   #        sql = "SELECT * FROM rentals
   #        WHERE id = $1"
   #        values = [@id]
   #        result = SqlRunner.run ( sql, values )
   #        return Rental.new( result.first )
   # end
end
