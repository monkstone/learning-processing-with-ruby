attr_reader :sz

def setup
  size 200, 200
  # An array to keep track of how often numbers are picked.
  @sz = 20
  @random_counts = Array.new(20, 0)
end

def draw
  # Pick a random number and increase the count.
  @random_counts[rand(0 ... sz)] += 1
  background 255
  stroke 0
  fill 175
  # Draw a rectangle to graph results
  @random_counts.each_with_index do |count, i|
    rect i * width / sz, height - count, (width / sz) - 1, height 
  end
end


