require './lib/display_board'
require_relative 'test_helper'

class GameBoardTest < Minitest::Test

  def test_it_renders_board
    display = DisplayBoard.new
    display.print_results
  end

  def test_it_renders_a_hit
    display = DisplayBoard.new
    coordinate = 'A1'

    display.render_shot(coordinate)

    display.render_shot(coordinate)
  end
end
