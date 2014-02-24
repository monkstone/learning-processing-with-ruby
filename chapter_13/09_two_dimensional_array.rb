
def setup
  size 200, 200
  no_smooth
  # initialize array with random values
  @my_array = Array.new(width) { Array.new(height) { rand 255 }}
  
  # draw the points
  width.times do |i|
    height.times do |j|
      stroke @my_array[i][j]
      point i, j
    end
  end
end


