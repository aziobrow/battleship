# Ships cannot wrap around the board
# Ships cannot overlap
# Ships can be laid either horizontally or vertically
# Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)
require_relative 'game_board'

#need to change so placing coordinate doesn't happen at initialize?
#missing middle for three ship coordinates

class Ships

  attr_reader :coordinates, :game_board

  def initialize(coordinates)
    @game_board = GameBoard.new
    @coordinates = coordinates.split(' ')
  end


  def coordinates_same_row?
    letter = @coordinates[0][0]
    row = @game_board.find_a_row(letter)
    return true if (row.keys & @coordinates) == @coordinates
    false
  end

  def coordinates_same_column?
    number = @coordinates[0][1]
    column = @game_board.find_a_column(number)
    return true if (column.keys & @coordinates) == @coordinates
    false
  end

  def already_used_coordinates?(coordinates)
    coordinates.each do |coordinate|
      @game_board.each_with_index do |position, index|
        if position[index].has_key?(coordinate)
          return true if position[index][coordinate] != nil
        end
      end
    end
    false
  end

  def invalid_ship_placement?(coordinates)
    true if coordinates != 2
    true if !(ships.same_column? && ships.same_row?)
    true if already_used_coordinates?(coordinates)
    #add for coordinates too far apart
    #add for coordinates outside of grid (iterate through keys to find match)
  end

  def mark_ships
    @coordinates.each do |coordinate|
      @game_board.each do |position|
        if position.has_key?(coordinate)
          position[coordinate] = true
        end
      end
    end
  end

end
