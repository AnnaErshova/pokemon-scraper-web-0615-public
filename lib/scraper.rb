require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  #@attr_accessor :pokemons

  def initialize(db) # need to initialize a database
    @db = db
  end # end initialize

  def scrape
    #html = File.read('pokemon_index.html')
    pokemon_page = Nokogiri::HTML(File.read('pokemon_index.html')) # open table with pokemon
    @pokemons = pokemon_page.css('span.infocard-tall')
    hydrate_and_save_pokemons
    #binding.pry
  end # end scrape

  def hydrate_and_save_pokemons
    @pokemons.collect do |pokemon|
      @name = pokemon.css("a.ent-name").text
      @type = pokemon.css("small.aside a").text
      # binding.pry
      Pokemon.save(@name, @type, @db)
    end
  end # end hydrate_pokemons

end # end class

