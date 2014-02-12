require 'bundler'
Bundler.require 
require 'sinatra/json'

require './lib/world'
require './lib/cell.rb'

module Life 
	class Game < Sinatra::Application
    helpers Sinatra::JSON
		get '/' do 
			@play = Play.new(World.new(10,10))
      @board = @play.world.board 
      gon.board = board 
		end 
	end 

end 

