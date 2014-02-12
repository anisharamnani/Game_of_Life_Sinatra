require 'bundler'
Bundler.require 
require 'sinatra/json'

require './lib/world'
require './lib/cell.rb'

module Life 
	class Game < Sinatra::Application
    helpers Sinatra::JSON

		get '/' do 
		end 

    get '/random_board' do 
      board = World.new(10,10)
      board.populate_random
      turns = []
      turns << board.cell_states
      json turns
    end	

  end 
end 

