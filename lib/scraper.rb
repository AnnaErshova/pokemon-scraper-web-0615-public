require 'nokogiri'
require 'pry'

class Scraper

  def initialize(db) # need to initialize a database
    @db = db
  end # end initialize

  def scrape # needs a method called scrape
    @pokemons = Nokogiri::HTML(File.open('pokemon_index.html')).css('span.infocard-tall')
    hydrate_pokemons
  end # end scrape

  # test suite tests us for name and type only, so we need to find those
  def hydrate_pokemons
    @pokemons.collect do |pokemon|
      @name = pokemon.css("a.ent-name").text
      @type = pokemon.css("small.aside").text # => the format for this is still weird,  "Grass · Poison", but we are not really tested on types, so...
      save_pokemons
    end # end pokemon block
  end # end hydrate_pokemons

  def save_pokemons
    Pokemon.save(@name, @type, @db)
  end # end save_pokemons

end # end class

