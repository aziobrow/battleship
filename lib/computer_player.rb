require_relative 'game_board'

class ComputerPlayer

  attr_reader :computer_game_board

  def initialize
    @computer_game_board = GameBoard.new
    @computer_ship_placement = Ships.new
  end

  def randomly_choose_coordinates_same_row(coordinate)
    coin_flip
    if coin_flip == 'heads'
      coordinate[0].concat((coordinate[1].to_i + 1).to_s)
    else
      coordinate[0].concat((coordinate[1].to_i - 1).to_s)
    end
  end

  def randomly_choose_coordinates_same_column(coordinate, size)
    coin_flip
    if coin_flip == 'heads'
      (coordinate[0].codepoint[0] + 1).chr.concat(coordinate[1])
    else
      (coordinate[0].codepoint[0] - 1).chr.concat(coordinate[1])
    end
  end

  def choose_random_ship
    row = @computer_game_board.board.sample
    first_coordinate = row.keys.sample
    if ships.two_unit_ship == false
      second_coordinate = choose_second_coordinate(first_coordinate, size = 1)
    elsif ships.two_unit_ship == true && ships.three_unit_ship == false
      second_coordinate = choose_second_coordinate(first_coordinate, size = 1)
    else
      #go to player ship sequence
    end

    coordinates = [first_coordinate, second_coordinate]
    if !invalid_ship_placement?(coordinates)
      mark_ships(coordinates)
    else
      choose_random_two_unit_ship
    end
  end

  def choose_second_coordinate(coordinate, size)
    coin_flip
    if coin_flip == 'heads'
      second_coordinate = randomly_choose_coordinates_same_row(first_coordinate)
    else
      second_coordinate = randomly_choose_coordinates_same_column(first_coordinate)
    end
  end

  def coin_flip
    coin_flip = ['heads', 'tails'].sample
  end


end
