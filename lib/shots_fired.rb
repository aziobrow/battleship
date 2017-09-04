require 'game_board'
require 'display_board'

class ShotsFired

  attr_reader :all_shots

  def initialize(game_board)
    @game_board = game_board
    @display_board = DisplayBoard.new
    @all_shots = []
  end

  def shot_is_fired(coordinate)
    hits = @game_board.winning_positions
    @all_shots << coordinate
    if hits.has_key?(coordinate)
      @display_board.render_shot(coordinate)
      #message about hit
      if (@all_shots & hits) == hits
        #return win sequence
      end
    else
      @display_board.render_shot(coordinate)
      #message about miss
    end
  end



end
