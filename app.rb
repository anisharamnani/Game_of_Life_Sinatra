require 'bundler'
Bundler.require 
require './lib/world'
require './lib/cell.rb'

module Life 
	class Game < Sinatra::Application
		get '/' do 
			@game = World.new(10,10)
      @game.populate_random	
      haml :index
		end 
	end 

  helpers do
    def run_game 
      @array = []
      loop do
        @array << @game.tick!
      end 
    end 
  end 
end 

