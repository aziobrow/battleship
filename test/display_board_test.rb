require './lib/display_board'
require_relative 'test_helper'

class GameBoardTest < Minitest::Test

  def test_it_renders_board
    display = DisplayBoard.new
  end
end
