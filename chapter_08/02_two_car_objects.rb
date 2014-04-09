# Introducing the ruby-processing control panel

load_library :control_panel
attr_reader :panel, :hide

def setup
  size 200, 200
  @hide = false
  control_panel do |c|
    c.look_feel "Metal"
    c.slider :red_car_speed, -5..15
    c.slider :blue_car_speed, -5..15
    @panel = c
  end
  
  # Initialize car objects
  @red_car  = Car.new(color(255,0,0), 0, 100)
  @blue_car  = Car.new(color(0,0,255), 0, 10)
  @red_car_speed = 1
  @blue_car_speed = 2
  rect_mode CENTER
end

def draw
  if !hide # only set once
    panel.visible = true 
    @hide = true
  end

  background 255

  # Operate the car object in draw
  # by calling object methods using the dots syntax.
  @red_car.move(@red_car_speed)
  @red_car.display_car
  @blue_car.move(@blue_car_speed)
  @blue_car.display_car
end



class Car # Define a class below the rest of the program.
  include Processing::Proxy
  
  attr_accessor :width, :temp_color, :temp_x_position, :temp_y_position, :temp_x_speed
  LENGTH = 20
  CHEIGHT = 10

  def initialize(temp_color, temp_x_position, temp_y_position)
    @width = $app.width
    @c = temp_color
    @xpos = temp_x_position
    @ypos = temp_y_position
  end

  def display_car # A new function of class Car
    stroke 0
    fill @c
    rect @xpos, @ypos, LENGTH, CHEIGHT
  end

  def move(speed)
    @xpos += speed
    @xpos = 0 if @xpos > width + LENGTH/2
    @xpos = width if @xpos < -LENGTH/2
  end
end


