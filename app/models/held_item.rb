class HeldItem < ApplicationRecord
    require 'net/http'
    require 'json'
  
    def self.fetch_all
      uri = URI('https://pokeapi.co/api/v2/item?limit=100') # Fetching 100 items for simplicity
      response = Net::HTTP.get(uri)
      items = JSON.parse(response)['results']
  
      items.each do |item|
        name = item['name'].capitalize
        description = fetch_description(item['url'])
        HeldItem.create(name: name, description: description)
      end
    end
  
    def self.fetch_description(url)
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)['effect_entries'][0]['effect']
    end
  end
  