

# Let's start by defining the cell class.
class Cell
  include Processing::Proxy
  def initialize(x, y, w, h, angle)
    @x, @y = x, y
    @w, @h = w, h
    @angle = angle
  end

  # we oscillate by increasing the angle, here.
  def oscillate
    @angle += 0.02
  end

  def display
    stroke 255
    # calculate color using sine wave
    fill 127 + 127 * Math.sin(@angle)
    rect @x, @y, @w, @h
  end
  
  def oscillate_and_display
    oscillate
    display
  end

end

def setup
  size 200, 200
  no_smooth
  @cols = @rows = 20

  # initialize array with random values
  @grid = Array.new(@cols) do |i| 
    Array.new(@rows) do |j|
      Cell.new(i*20, j*20, 20, 20, i+j)
    end
  end
end

def draw
  background 0
  @grid.each { |array| array.each { |cell| cell.oscillate_and_display } }
end


