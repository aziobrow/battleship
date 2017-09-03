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
    @game_board = GameBoard.new.setup_board
    @coordinates = coordinates.split(' ')
  end

  def same_row?
    letter = @coordinates[0][0]
    keys = []
    @game_board.each do |position|
      position.each do |game_square|
        keys << game_square.keys
        require "pry"; binding.pry
      end
    end
    return true if (keys & @coordinates) == @coordinates
    false
  end

  def same_column?
    columns = ['1', '2', '3', '4']
    columns.each do |column|
      return true if @coordinates.all? {|coordinate| coordinate.end_with?(column)}
    end
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
