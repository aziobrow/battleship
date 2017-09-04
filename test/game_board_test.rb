require_relative 'test_helper'
require './lib/game_board'

class GameBoardTest < Minitest::Test

  def test_it_initializes_into_array_of_four_arrays_with_rows_and_columns
    game_board = GameBoard.new

    assert_instance_of Array, game_board.board
    assert_equal 4, game_board.board.count
    assert_equal ({'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3}), game_board.rows
    assert_equal (['1', '2', '3', '4']), game_board.columns
  end

  def test_it_can_assign_key_values_to_a_row
    game_board = GameBoard.new
    row = []
    letter = 'A'

    assert_equal ({"A1"=>nil, "A2"=>nil, "A3"=>nil, "A4"=>nil}), game_board.set_key_values_for_row(row, letter)
  end

  def test_it_can_set_up_a_board_with_appropriate_key_values
    skip
    game_board = GameBoard.new
    p game_board
  end

  def test_it_can_find_elements_in_same_row
    game_board = GameBoard.new

    assert_equal ({'A1'=> nil, 'A2'=> nil, 'A3'=> nil, 'A4'=> nil}), game_board.find_a_row('A')
  end

  def test_it_can_find_elements_in_same_column
    game_board = GameBoard.new

    assert_equal ({'A1'=> nil, 'B1'=> nil, 'C1'=> nil, 'D1'=> nil}), game_board.find_a_column('1')
  end

  def test_it_renders_board
    game_board = GameBoard.new

    p game_board.render_board
  end

end
