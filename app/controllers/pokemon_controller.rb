# app/controllers/pokemon_controller.rb
class PokemonController < ApplicationController
  require 'httparty'

  def index
    if params[:search]
      response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=1000")  # Increase limit to get all pokemons
      pokemons = response.parsed_response['results']
      @pokemons = pokemons.select { |pokemon| pokemon['name'].start_with?(params[:search]) }
    else
      response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=10')
      @pokemons = response.parsed_response['results']
    end
  end

  def show
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{params[:id]}")
    @pokemon = response.parsed_response
  end
end
