class GameBoard

  attr_reader :board

  def initialize
    @board = Array.new(4) {[]}
    @a_row = @board[0]
    @b_row = @board[1]
    @c_row = @board[2]
    @d_row = @board[3]
  end

  def setup_board
    letters = ['A', 'B', 'C', 'D']

    letters.each_with_index do |letter, index|
      row = @board[index]
      set_key_values_for_row(row, letter)
    end
    @board
  end

  def set_key_values_for_row(row, letter)
      number = 1
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
