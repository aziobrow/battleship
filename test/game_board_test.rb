require_relative 'test_helper'
require './lib/game_board'

class GameBoardTest < Minitest::Test

  def test_it_initializes_into_array_of_four_arrays_with_four_hashes
    game_board = GameBoard.new
    assert_equal [], game_board.board
  end

  def test_it_can_assign_key_values_to_a_row
    game_board = GameBoard.new
    row = []
    letter = 'A'

    assert_equal [{'A1'=> nil},{'A2'=> nil},{'A3'=> nil},{'A4'=> nil}], game_board.set_key_values_for_row(row, letter)
  end

  def test_it_can_set_up_a_board_with_appropriate_key_values
    game_board = GameBoard.new
    p game_board.setup_board[0]
  end
end
