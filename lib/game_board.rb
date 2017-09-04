class GameBoard

  attr_reader :board, :rows, :columns, :winning_positions

  def initialize
    @board = setup_board
    @rows = {'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3}
    @columns = ['1', '2', '3', '4']
    @winning_positions = []
  end

  def setup_board
    letters = ['A', 'B', 'C', 'D']
    board = Array.new(4) {[]}

    letters.each_with_index do |letter, index|
      row = board[index]
      row << set_key_values_for_row(row, letter)
    end
    board
  end

  def set_key_values_for_row(row, letter)
      number = 1
      row = Hash.new
      4.times do |position|
      key_value = letter + number.to_s
      row[key_value] = nil
      number += 1
    end
    row
  end

  def find_a_row(letter)
    index = @rows[letter]
    row_elements = @board[index]
    row_elements[0]
  end

  def find_a_column(number)
    column_elements = []
    @board.map do |game_row|
      column_elements << game_row[0].find {|key, value| key.end_with?(number)}
    end
    column_elements.to_h
  end

  def win_condition
    @board.each do |row|
      row.each_key do |key|
        @winning_positions << row[key] if row[key] != nil
      end
    end
  end

end
