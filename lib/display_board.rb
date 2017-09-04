require_relative 'game_board'

class DisplayBoard

  attr_reader :board_layout, :row_label, :column_label

  def initialize
    @board_layout = Array.new(4, " ").map{|row| Array.new(4, " ")}
    @row_label = ["A", "B", "C", "D"]
    @column_label = ["1", "2", "3", "4"]
    @game_board = GameBoard.new
    @all_coordinates = []
  end

  def print_results
    print "\t"
    print @row_label.join("\t")
    print "\n"
    puts
    @board_layout.each_with_index do |row, index|
      print @column_label[index]
      print "\t"
      print row.join("\t")
      print "\n"
      puts
    end
  end

  def render_shot(coordinate)
    @all_coordinates << coordinate

    @all_coordinates.each do |coordinate|
      row = @row_label.index(coordinate[0])
      column = @column_label.index(coordinate[1])

      if @game_board.winning_positions.include?(coordinate)
        @board_layout[row][column] = 'H'
        print_results
      else
        @board_layout[row][column] = 'M'
        print_results
      end
    end
  end

end
