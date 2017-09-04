# Ships cannot wrap around the board
# Ships cannot overlap
# Ships can be laid either horizontally or vertically
# Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)
require_relative 'game_board'

#need to change so placing coordinate doesn't happen at initialize?
#missing middle for three ship coordinates

class Ships

  attr_reader :coordinates, :game_board, :two_unit_ship, :three_unit_ship

  def initialize(coordinates)
    @game_board = GameBoard.new
    @coordinates = coordinates.split(' ')
    @two_unit_ship = false
    @three_unit_ship = false
  end

  def request_second_pair_of_coordinates
    #call instructions class here?
  end

  def consecutive?(values_to_check)
    values = values_to_check.sort
    return true if values[1] == (values[0].codepoints[0] + 1).chr
    false
  end

  def set_three_coordinates(coordinates, columns_or_rows)
    if coordinates_same_row?
      columns = columns_or_rows
      middle_coordinate_column = (coordinates[1].to_i + 1)
      middle_coordinate = coordinates[0].concat(middle_coordinate_column.to_s)
      @coordinates = coordinates[0..1], middle_coordinate, coordinates[3..4]
    elsif coordinates_same_column?
      rows = columns_or_rows
      middle_coordinate_row = (coordinates[0].codepoints[0] + 1).chr
      middle_coordinate = middle_coordinate_row.concat(coordinates[1])
      @coordinates = coordinates[0..1], middle_coordinate, coordinates[3..4]
    else
      #do something here
    end
  end

  def check_coordinates(coordinates)
    #will need to probably put split in here but it will break other tests)
    if coordinates_same_row?
      columns = @coordinates.collect { |coordinate| coordinate[0][1]  }
      if consecutive?(columns)
        @coordinates
      else
        set_three_coordinates(coordinates, columns)
      end
    elsif coordinates_same_column?
      #try to put this in a method-you use this a lot
      rows = @coordinates.collect { |coordinate| coordinate[0][0]  }
      if consecutive?(rows)
        @coordinates
      else
        set_three_coordinates(coordinates, rows)
      end
    else
      #put something here
    end
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
    @coordinates.each do |coordinate|
      @game_board.board.each_with_index do |row, index|
        if row[0].has_key?(coordinate)
          return true if row[0][coordinate] != nil
        end
      end
    end
    false
  end

  def has_coordinates_on_gameboard?(coordinates)
    valid_coordinates = []
    @game_board.board.each do |row|
      @coordinates.each do |coordinate|
        if row[0].has_key?(coordinate)
          valid_coordinates << coordinate
        end
      end
    end
    return true if (valid_coordinates & @coordinates) == @coordinates
    false
  end

  def invalid_ship_placement?(coordinates)
    return true if @coordinates.length != 2
    return true if coordinates_same_column? && coordinates_same_row
    return true if !(coordinates_same_column? || coordinates_same_row?)
    return true if already_used_coordinates?(coordinates)
    return true if count_coordinate_range(coordinates) > 2
    return true if !has_coordinates_on_gameboard?(coordinates)
    return true if count_coordinate_range(coordinates) == 2 and @three_unit_ship == true
    return true if count_coordinate_range(coordinates) == 1 and @two_unit_ship == true
    false
  end

  def mark_ships(coordinates)
    @coordinates.each do |coordinate|
      @game_board.board.each do |row|
        if row[0].has_key?(coordinate)
          row[0][coordinate] = true
          if count_coordinate_range(coordinate) == 2
            @three_unit_ship = true
          else
            @two_unit_ship = true
          end
        end
      end
    end
  end

  def count_coordinate_range(coordinates)
    if coordinates_same_row?
      columns = @coordinates.collect { |coordinate| coordinate[1]  }
      columns[1].to_i - columns[0].to_i
    elsif coordinates_same_column?
      rows = @coordinates.collect { |coordinate| coordinate[0][0]  }
      rows[1].codepoints[0] - rows[0].codepoints[0]
    else
      #put something here
    end
  end



end
