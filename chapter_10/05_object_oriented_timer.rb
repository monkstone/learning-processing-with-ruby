

def setup
  size 200, 200
  background 0
  @timer = Timer.new(5000)
  @timer.start
end

def draw
  if @timer.finished?
    background rand(255)
    @timer.start
  end
end

class Timer
  def initialize(total_time)
    @saved_time = nil         # When it started
    @total_time = total_time  # How long it should last
  end
  
  # When the timer starts it stores the current time in milliseconds
  def start
    @saved_time = millis
  end
  
  # The method finished? returns true if 5 seconds have passed.
  # Most of the work of the timer is farmed out to this method.
  def finished?
    passed_time = millis - @saved_time
    passed_time > @total_time
  end
  
  
end
