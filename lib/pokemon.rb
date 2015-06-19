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
    pokemon_details = db.execute("SELECT name, type, hp FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(db, pokemon_details[0], pokemon_details[1], pokemon_details[2])
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
    db.execute(sql, name, type)
  end # end save

  def alter_hp(hp) #id = row number effectively
    sql = "UPDATE pokemon SET hp=? WHERE name=?"
    @db.execute(sql, hp, @name) 
    @hp = hp
  end # alter_hp

end # end class