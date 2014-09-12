# using attr_reader to create a getter for object variables 
# you can use attr_accessor, but it is probably best reserved to
# create a getter and setter that will be used from outside the class

attr_reader :circle_x, :circle_y

def setup
  size 200, 200
  # initialize two integer object variables.
  @circle_x = 0
  @circle_y = 100
  smooth 4
end

def draw
  background 255
  stroke 0
  fill 175
  
  # Using getters to access the object variables to specify the location of the circle
  ellipse circle_x, circle_y, 50, 50
  
  # An assignment operation that increments the value of circle_x by 1.
  # note we need to use the '@' sigil prefix when assigning to the object variable
  @circle_x += 1
end
  

