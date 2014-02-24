
def setup
  size 200, 200
  # An array to keep track of how often numbers are picked.
  @random_counts = Array.new(20, 0)
end

def draw
  size = @random_counts.size
  # Pick a random number and increase the count.
  @random_counts[rand(size)] += 1
  background 255
  stroke 0
  fill 175
  # Draw a rectangle to graph results
  @random_counts.each_with_index do |count, i|
    rect i * width / size, height - count, (width / size)-1, height 
  end
end


