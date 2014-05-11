# Let's start by defining the cell class, we use Processing::Proxy mixin to
# access variable/methods of processing within Cell class (similar to vanilla
# processings inner class access)

class Cell
  include Processing::Proxy
  attr_reader :x, :y, :w, :h, :angle
  
  def initialize(x, y, sz)
    @x, @y = x * sz, y * sz
    @w, @h = sz, sz
    @angle = x + y
  end

  # we oscillate by increasing the angle, here.
  def oscillate
    @angle += 0.02
  end

  def display
    stroke 255
    # calculate color using sine wave
    fill 127 + 127 * sin(angle)
    rect x, y, w, h
  end
  
  def oscillate_and_display
    oscillate
    display
  end

end

def setup
  size 200, 200
  no_smooth
  sz = 20

  # initialize array with random values
  @grid = (0 .. sz).map{|i| (0 .. sz).map {|j| Cell.new(i, j, sz) } }
 
end

def draw
  background 0
  @grid.map { |array| array.map { |cell| cell.oscillate_and_display } }
end


