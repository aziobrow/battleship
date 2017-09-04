class DisplayBoard
  def initialize
    @results = print_results
  end

  def print_results
    board_layout = Array.new(5, " ").map{|row| Array.new(5, " ")}
    row_label = ["A", "B", "C", "D"]
    column_label = ["1", "2", "3", "4"]


    print "\t"
    print row_label.join("\t")
    puts
    board_layout.each_with_index do |row, index|
      print column_label[index]
      print "\t"
      print row.join("\t")
      print "\n"
      puts
    end
  end
end
