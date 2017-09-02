require './lib/instructions'

class Battleship
  def initialize
    @instructions = Instructions.new
    @instructions.welcome_screen_selection
  end
end

Battleship.new
