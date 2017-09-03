require_relative 'test_helper'
require './lib/coordinates'

class CoordinatesTest < Minitest::Test

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
end
