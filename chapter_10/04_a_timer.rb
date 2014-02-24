

def setup
  size 200, 200
  background 0
  @total_time = 5000
  @saved_time = millis
end

def draw
  passed_time = millis - @saved_time
  # Has 5 seconds passed?
  if passed_time > @total_time
    puts "5 seconds have elapsed!"
    # Color a new background, and let's give it some color.
    background rand(255), rand(255), rand(255)
    @saved_time = millis  # Save the current time to restart the timer!
  end
end
