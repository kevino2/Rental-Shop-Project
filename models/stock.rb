require_relative('../db/sql_runner.rb')
class Stock

  attr_accessor :stock_item, :size, :product_image, :rented
  attr_reader :id
def initialize(options)
  @id = options['id'].to_i
  @stock_item = options['stock_item']
  @size = options['size']
  @product_image = options['product_image']
  @rented = options['rented']
end

def save
sql = 'INSERT INTO stocks (
        stock_item,
        size,
        product_image,
        rented
        )
        VALUES ($1, $2, $3, $4) RETURNING *'
        values = [@stock_item, @size, @product_image, @rented]
        @id = SqlRunner.run(sql, values).first()['id']
end

def self.all()
        sql = "SELECT * FROM stocks"
        results = SqlRunner.run( sql )
        return results.map { |stock| Stock.new( stock ) }
end

def self.find( id )
        sql = "SELECT * FROM stocks
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run( sql, values )
        return Stock.new( results.first )
end

def self.delete_all
        sql = "DELETE FROM stocks"
        SqlRunner.run( sql )
end

def delete()
        sql = "DELETE FROM stocks
        WHERE id = $1"
        values = [@id]
        SqlRunner.run( sql, values )
end

def customer()
        sql = "SELECT c.* FROM customers c
        INNER JOIN rentals r ON r.customer_id = c.id
        WHERE r.stock_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |cust| Customer.new(cust) }
end

def stock_rented_true
        sql = "UPDATE stocks
        SET rented = $1
        WHERE id = $2"
        values = ["t", @id]
        SqlRunner.run(sql, values)
        @rented = 't'
end

def stock_rented_false
        sql = "UPDATE stocks
        SET rented = $1
        WHERE id = $2"
        values = ["f", @id]
        SqlRunner.run(sql, values)
        @rented = 'f'
end

# create array that takes unrented stock


def  Stock.currently_rented ()
        sql = "SELECT * FROM stocks WHERE rented = t"
        results = SqlRunner.run (sql)
        return results.map { |stock| Stock.new(stock)  }
end


end
