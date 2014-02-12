require './lib/cell'

puts `clear` # just clears the terminal window so you dont have leftover characters

class World 
	attr_accessor :board
	attr_reader :x, :y
	def initialize (x,y) 
		@board = []
		@x = x 
		@y = y 
	end 

	def populate_random 
		# how do you hard code the board 
		x.times do |i|
			@board << []
			y.times do |j|
				r = rand(1..4)
				r < 3 ? state = "alive" : state = "dead"
				Cell.new(self, i, j, state)
			end 
		end 
	end 


	def tick!
		@board.each do |row|
			row.each do |cell|
				cell.change_state 
				cell.transition_state 
			end 
		end
		@board
	end 

	def just_the_states
	board.each do |row|
	  row.each do |cell|
	    cell.alive? ? cells << 1 : cells << 0 
	  end 
	  @states << states_array  
	end
	@states = states_array.to_json
	end

end 



