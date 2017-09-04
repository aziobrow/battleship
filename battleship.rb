require './lib/instructions'

class Battleship

  attr_reader :instructions, :player_board, :ai_board, :player, :ai

  def initialize
    @instructions = Instructions.new.welcome_screen_selection
    @player_board = GameBoard.new
    @ai_board = GameBoard.new
    @player = Player.new
    @ai = ComputerPlayer.new
  end
end

Battleship.new
