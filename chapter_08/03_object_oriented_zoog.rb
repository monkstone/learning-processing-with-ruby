require 'zoog' # zoog class is defined in zoog.rb

load_library :control_panel
attr_reader :panel, :hide

def setup
  size 200, 200
  smooth 4
  control_panel do |c|
    c.look_feel "Metal"
    c.slider :zoog_jiggle_factor, 0..width / 10, 5.0
    @panel = c
  end
  
  # Initalize zoog
  @zoog = Zoog.new(100, 125, 60, 60, 16)

  
  rect_mode CENTER
  ellipse_mode CENTER
end

def draw
  if !hide # only set once
    panel.visible = true 
    @hide = true
  end
  background 255
  
  # mouse_x position determines speed factor
  # factor = constrain(mouse_x / 10, 0, 5)
  
  @zoog.jiggle(@zoog_jiggle_factor)
  @zoog.display
end