
class Planet
  include Processing::Proxy
  # Each planet object keeps track of its own angle of rotation.
  # @theta        Rotation around sun
  # @diameter     Size of planet
  # @distance     Distance from sun
  # @orbit_speed  Orbit speed
  def initialize(distance, diameter)
    @distance = distance
    @diameter = diameter
    @theta = 0
    @orbit_speed = rand(-0.01 .. 0.01) 
  end

  def update
    # Increment the angle to rotate
    @theta += @orbit_speed
  end

  def display
    # Before rotation and translation, the state of the matrix is saved with push_matrix.
    push_matrix 
    # Rotate orbit
    rotate @theta 
    # translate out @distance
    translate @distance, 0 
    stroke 0
    fill 175
    ellipse 0, 0, @diameter, @diameter
    # Once the planet is drawn, the matrix is restored with pop_matrix so that the next planet is not affected.
    pop_matrix 
  end

end


def setup
  size 200, 200
  smooth 4
  @planets = (0 .. 8).map{ |i| Planet.new(20 + i * 10, i + 8) }
end

def draw
  background 50, 50, 100

  # Drawing the Sun
  push_matrix
  # Translate to center of window
  translate width / 2, height / 2
  stroke 0
  fill 255
  ellipse 0, 0, 20, 20

  # Drawing all Planets
  @planets.each do |p|
    p.update
    p.display
  end

  pop_matrix
end



