class Coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def create_coordinates(coordinates)
    coordinates = coordinates.split(' ')
    if coordinates.same_row?
      #check for adjacent columns
    elsif coordinates.same_column?
      #check for adjacent rows
    else
      p "Coordinates must be horizontal or diagonal and must not wrap around corners."
      #ask for input again.
    end
  end

  def check_for_adjacent_columns(coordinates)
    columns = ['1', '2', '3', '4']
    columns.each do |column|
      if

  end
  
  def same_row?
    rows = ['A', 'B', 'C', 'D'] #would be better to get these from hash keys
    rows.each do |row|
      return true if @coordinates.all? {|coordinate| coordinate.start_with?(row)}
    end
    false
  end

  def same_column?
    columns = ['1', '2', '3', '4']
    columns.each do |column|
      return true if @coordinates.all? {|coordinate| coordinate.end_with?(column)}
    end
    false
  end
end
