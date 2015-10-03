class Segment
  attr_accessor :x, :y

  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
  end

  def draw
    @window.draw_quad(@x, @y, Gosu::Color::GREEN,@x + 10,@y, Gosu::Color::GREEN,@x ,@y + 10,Gosu::Color::GREEN,@x + 10,@y + 10,Gosu::Color::GREEN)
  end
end
