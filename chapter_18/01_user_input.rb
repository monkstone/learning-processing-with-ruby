#
# Example 18-1: User input
#
def setup
  size 300, 200
  @typing, @saved = "", ""
  text_font create_font "Arial", 16, true # set the font for text
end

def draw
  background 255
  indent = 25
  fill 0 # Set the fill for text

  # Display everything
  text "Click in this applet and type. \nHit return to save what you typed. ", indent, 40
  text @typing, indent, 90
  text @saved, indent, 130  
end

def key_pressed
  # If the return key is pressed, save the String and clear it
  if key == "\n"
    @saved  = @typing
    @typing = "" # A String can be cleared by setting it equal to ""
  else
    # Otherwise, concatenate the String
    # Each character typed by the user is added to the 
    # end of the String variable.
    @typing = @typing + key if key.is_a? String 
  end
end
