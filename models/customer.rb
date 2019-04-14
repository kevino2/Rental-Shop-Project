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
    return results.map { |hash| Zombie.new( hash ) }
  end

end
