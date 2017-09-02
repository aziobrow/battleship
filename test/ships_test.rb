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

    assert ships.same_row?

    coordinates = 'A1 B1'
    ships = Ships.new(coordinates)

    refute ships.same_row?
  end

  def test_it_knows_if_coordinates_are_in_same_column
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)

    refute ships.same_column?

    coordinates = 'A1 B1'
    ships = Ships.new(coordinates)

    assert ships.same_column?
  end

  def test_it_knows_already_used_coordinates?
    coordinates = 'A1 A2'
    ships = Ships.new(coordinates)
    coordinates = ships.coordinates

    refute ships.already_used_coordinates?(coordinates)
  end


end
