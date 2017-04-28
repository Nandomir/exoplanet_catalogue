require_relative('../db/sql_runner.rb')

class Astronomer

attr_reader :id
attr_accessor :discoverer, :observation_type

def initialize ( options )
  @id = options['id'].to_i if options['id']
  @discoverer = options['discoverer']
  @observation_type = options['observation_type']
end

  def save()
    sql = "INSERT INTO astronomers (discoverer, observation_type) VALUES ('#{@discoverer}', '#{@observation_type}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM astronomers;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM astronomers;"
    data = SqlRunner.run(sql)
    return data.map{|astronomer| Astronomer.new(astronomer)}
  end

  def self.find(id)
    sql = "SELECT * FROM astronomers WHERE id = #{id};"
    data = SqlRunner.run(sql)
    return Astronomer.new(data.first)
  end

  def update()
    sql = "UPDATE astronomers SET (discoverer, observation_type) = ('#{@discoverer}', '#{@observation_type}') WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM astronomers WHERE id=#{@id};"
    SqlRunner.run( sql )
  end
end