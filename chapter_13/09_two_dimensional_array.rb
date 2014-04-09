
def setup
  size 200, 200
  no_smooth
  # initialize array with random values
  my_array = Array.new(width) { Array.new(height) { rand 255 }}
  # render my_array
  my_array.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      stroke cell
      point i, j
    end
  end
end


