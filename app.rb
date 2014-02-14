require 'bundler'
Bundler.require 
require 'sinatra/json'

require './lib/world'
require './lib/cell.rb'

module Life 
	class Game < Sinatra::Application
    helpers Sinatra::JSON
    enable :sessions

    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public/app'
    end

		get '/' do
      File.read(File.join('public/app', 'index.html')) 
		end 

    get '/random_board' do 
      board = World.new(10,10)
      board.populate_random
      turns = []
      turns << board.cell_states
      5.times do 
        board.tick! 
        turns << board.cell_states 
      end 
      session[:states] = turns[-1]
      json turns
    end	

    get '/tick_board' do
      board = World.new(10,10)
      board.populate(session[:states])
      turns = []
      turns << board.cell_states
      5.times do 
        board.tick! 
        turns << board.cell_states 
      end 
      json turns
    end 

  end 
end 

