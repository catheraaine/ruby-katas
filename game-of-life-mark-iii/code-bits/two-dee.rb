cells = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]

cells.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    puts "#{x}, #{y}"
    puts "The cell value is #{cell}."
  end
end
