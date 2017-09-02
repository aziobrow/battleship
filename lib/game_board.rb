class GameBoard

  attr_reader :board

  def initialize
    @board = []
  end

  def setup_board
    letters = ['A', 'B', 'C', 'D']
    row = @board

    letters.each do |letter|
      set_key_values_for_row(row, letter)
    end
    @board
  end

  def set_key_values_for_row(row, letter)
      number = 1
      values = []
      4.times do |position|
      key_value = letter + number.to_s
      position = Hash.new
      position[key_value] = nil
      row << position
      number += 1
    end
    row
  end

end
