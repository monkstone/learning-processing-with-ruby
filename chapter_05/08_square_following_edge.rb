attr_reader :square, :speed

def setup
  size 200, 200
  @square = State.new(0, 0, 0)
  @speed = 5
end

def draw
  background 255
  
  # Display the square.
  stroke 0
  fill 175
  rect square.x, square.y, 9, 9
  
  # The following section uses a "case" statement. Cases let you
  # set up different blocks of code for specific values of variables,
  # as an alternative to a long if, elsif, else, kind of structure.
  
  # If the state is 0,  move to the right.
  case square.state
  when 0
    square.x += speed
    # If,  while the state is 0,  it reaches the right side of the window,  change the state to 1
    # Repeat this same logic for all states!?
    if square.x > width - 10
      square.x = width - 10
      square.state = 1
    end
  when 1
    square.y += speed
    if square.y > height - 10
      square.y = height - 10
      square.state = 2
    end
  when 2
    square.x -= speed
    if square.x < 0
      square.x = 0
      square.state = 3
    end
  when 3
    square.y -=  speed
    if square.y < 0
      square.y = 0
      square.state = 0
    end
  end

end

# A ruby Struct is a convenient way to bundle a number of attributes together, 
# using accessor methods, without having to write an explicit class.

State = Struct.new(:state, :x, :y) 
