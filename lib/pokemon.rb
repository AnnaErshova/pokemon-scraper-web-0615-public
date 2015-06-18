require 'nokogiri'
require 'open-uri'
require 'pry'

class Pokemon

  def initialize(db, name, type, hp=60)
    @db = db
    @name = name
    @type = type
    @hp = hp
  end # end initialize

  # class methods 

  def self.find(id, db)
    stats = @db.execute("SELECT name, type FROM pokemon WHERE id = ?;").flatten
    Pokemon.new(@db, stats[0], stats[1])
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
    db.execute(sql, name, type)
  end # end save

  def alter_hp(hp) #id = row number effectively
    sql = "UPDATE pokemon SET hp=? WHERE name=?"
    @db.execute(sql, @hp, @name) 
  end
end # end class

# pokemons should themselves save information about them to the database
