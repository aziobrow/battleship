require_relative 'test_helper'
require './lib/ships'

class ShipsTest < Minitest::Test
  def test_it_initializes_with_game_board_and_coordinates_as_array
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)

    assert_instance_of Ships, ships
    refute nil, ships.game_board
    assert_equal ['A1', 'A2'], ships.coordinates
  end

  def test_it_knows_if_coordinates_are_in_same_row
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)

    assert ships.coordinates_same_row?

    coordinates = 'C1 C2'
    ships = Ships.new(coordinates)

    assert ships.coordinates_same_row?

    coordinates = 'A1 B1'
    ships = Ships.new(coordinates)

    refute ships.coordinates_same_row?
  end

  def test_it_knows_if_coordinates_are_in_same_column
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)

    refute ships.coordinates_same_column?

    coordinates = 'A1 B1'
    ships = Ships.new(coordinates)

    assert ships.coordinates_same_column?
  end

  def test_it_knows_already_used_coordinates?
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)
    coordinates = ships.coordinates

    refute ships.already_used_coordinates?(coordinates)
  end

  def test_it_can_mark_placement_of_ships
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)
    coordinates = ships.coordinates
    ships.mark_ships(coordinates)

    assert ships.game_board.board[0][0]['A1']
  end

  def test_it_can_check_for_consecutive_squares
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)
    columns = ['1','2']

    assert ships.consecutive?(columns)

    rows = ['A', 'B']

    assert ships.consecutive?(rows)

    columns = ['1', '3']

    refute ships.consecutive?(columns)

    rows = ['B', 'D']

    refute ships.consecutive?(rows)
  end

  def test_it_can_generate_three_coordinates_given_range_of_same_row_coordinates
    coordinates = 'A1 A3'
    ships = Ships.new(coordinates)
    columns = ['1', '3']
    ships.set_three_coordinates(coordinates, columns)

    assert_equal ['A1', 'A2', 'A3'], ships.coordinates
  end

  def test_it_can_generate_three_coordinates_given_range_of_same_column_coordinates
    coordinates = 'B1 D1'
    ships = Ships.new(coordinates)
    rows = ['B', 'D']
    ships.set_three_coordinates(coordinates, rows)

    assert_equal ['B1', 'C1', 'D1'], ships.coordinates
  end

  def test_it_can_count_size_of_ship
    coordinates = 'A1 A3'
    ships = Ships.new(coordinates)

    assert_equal 2, ships.count_coordinate_range(coordinates)

    coordinates = 'C1 C2'
    ships = Ships.new(coordinates)

    assert_equal 1, ships.count_coordinate_range(coordinates)

    coordinates = 'B2 D2'
    ships = Ships.new(coordinates)

    assert_equal 2, ships.count_coordinate_range(coordinates)
  end

  def test_it_marks_two_unit_and_three_unit_ships_as_placed
    coordinates = 'C1 C3'
    ships = Ships.new(coordinates)
    ships.mark_ships(coordinates)

    assert ships.three_unit_ship

    coordinates = 'B1 C1'
    ships = Ships.new(coordinates)
    ships.mark_ships(coordinates)

    assert ships.two_unit_ship
  end

  def test_it_knows_valid_coordinates
    coordinates = 'A1 A3'
    ships = Ships.new(coordinates)

    assert ships.has_coordinates_on_gameboard?(coordinates)

    coordinates = 'A1 E3'
    ships = Ships.new(coordinates)

    refute ships.has_coordinates_on_gameboard?(coordinates)

    coordinates = 'C2 B7'
    ships = Ships.new(coordinates)

    refute ships.has_coordinates_on_gameboard?(coordinates)
  end

  def test_it_recognizes_invalid_ship_placement
    coordinates = 'D1 D3'
    ships = Ships.new(coordinates)

    refute ships.invalid_ship_placement?(coordinates)
    
    coordinates = 'D1'
    ships = Ships.new(coordinates)

    assert ships.invalid_ship_placement?(coordinates)

    coordinates = 'A1 A1'
    ships = Ships.new(coordinates)

    assert ships.invalid_ship_placement?(coordinates)

    coordinates = 'D1 B2'
    ships = Ships.new(coordinates)

    assert ships.invalid_ship_placement?(coordinates)

    coordinates = 'C1 C4'
    ships = Ships.new(coordinates)

    assert ships.invalid_ship_placement?(coordinates)

    coordinates = 'B3 Z2'
    ships = Ships.new(coordinates)

    assert ships.invalid_ship_placement?(coordinates)
  end

end
