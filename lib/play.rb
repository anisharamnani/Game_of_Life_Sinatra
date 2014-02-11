require './lib/world'

class Play 
  attr_reader :world
  attr_accessor :states
  def initialize world
    @world = world 
  end 

  def just_the_states
    cells = []
    states_array = []
    @world.board.each do |row|
      row.each do |cell|
        cell.alive? ? cells << 1 : cells << 0 
      end 
      @states << states_array  
    end
    @states = states_array.to_json
  end 

  def run_game 
    loop do
      @world.tick!
      just_the_states
    end
    @states 
  end 

end  
