class Apple
  attr_accessor :x, :y

  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
  end

  def draw
    @window.draw_quad(@x, @y, Gosu::Color::RED,@x + 10,@y, Gosu::Color::RED,@x ,@y + 10,Gosu::Color::RED,@x + 10,@y + 10,Gosu::Color::RED)
  end
end
