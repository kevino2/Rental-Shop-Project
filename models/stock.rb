require_relative('../db/sql_runner.rb')
class Stock

  attr_accessor :stock_item, :size, :product_image
  attr_reader :id
def initialize(options)
  @id = options['id'].to_i
  @stock_item = options['stock_item']
  @size = options['size']
  @product_image = options['product_image']
end

def save
sql = 'INSERT INTO stocks (
        stock_item,
        size,
        product_image
        )
        VALUES ($1, $2, $3) RETURNING *'
        values = [@stock_item, @size, @product_image]
        @id = SqlRunner.run(sql, values).first()['id']
end


end
