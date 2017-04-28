require_relative('../db/sql_runner.rb')

class Exoplanet

attr_reader :id
attr_accessor :name, :type, :habitable, :mass, :discovery

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @type = options['type']
  @habitable = options['habitable']
  @mass = options['mass'].to_f
  @discovery = options['discovery']
end

def save()
  sql = "INSERT INTO exoplanets (name, type, habitable, mass, discovery) VALUES ('#{@name}', '#{@type}', '#{@habitable}', #{mass}, '#{discovery}') RETURNING *;"
  data = SqlRunner.run(sql)
  @id = data[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM exoplanets;"
  data = SqlRunner.run(sql)
  return data.map {|exoplanet| Exoplanet.new(exoplanet)}
end

def self.delete_all()
  sql = "DELETE FROM exoplanets;"
  SqlRunner.run(sql)
end

def self.habitable()
  sql = "SELECT name, type, mass, discovery FROM exoplanets WHERE habitable = #{true};"
  data = SqlRunner.run(sql)
  return data.map{|habitable| Exoplanet.new(habitable)}
end

def self.find(id)
  sql = "SELECT * FROM exoplanets WHERE id = #{id}"
  data = SqlRunner.run(sql).first
  return Exoplanet.new(data)
end

def update()
  sql = "UPDATE exoplanets SET
        name = '#{@name}',
        type = '#{@type}',
        mass = #{@mass},
        discovery = '#{@discovery}' 
        WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM exoplanets WHERE id=#{@id};"
  SqlRunner.run( sql )
end

end