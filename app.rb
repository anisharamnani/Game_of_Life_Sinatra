require 'bundler'
Bundler.require 
require './lib/world'
require './lib/cell.rb'
require './lib/play.rb'

module Life 
	class Game < Sinatra::Application
    register Gon::Sinatra
		get '/' do 
			@play = Play.new(World.new(10,10))
      @board = @play.world.board 
      gon.board = board 
		end 
	end 

end 

