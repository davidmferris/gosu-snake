require 'singleton'

class PlayState < GameState
  include Singleton

  def initialize
    @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    @snake = Snake.new
    @apples = [new_apple]
    @font = Gosu::Font.new(20)
  end

  def button_down(id)
    super

    if id == Gosu::KbLeft
      @snake.change_direction(:left)
    elsif id == Gosu::KbRight
      @snake.change_direction(:right)
    elsif id == Gosu::KbUp
      @snake.change_direction(:up)
    elsif id == Gosu::KbDown
      @snake.change_direction(:down)
    end
  end

  def update
    @snake.move
    @snake.update_segments

    if @snake.ate_apple(@apples)
      @snake.increase_length
      @apples.push(new_apple)
    end

    if @snake.hit_wall?
      GameState.switch(EndState.instance)
    end
  end

  def draw
    @snake.draw
    @apples.each { |apple| apple.draw }
    @font.draw("Score: #{@snake.score}", 10, 10, 3  , 1.0, 1.0, 0xff_ffff00)
  end

  def new_apple
    Apple.new($window, rand(640), rand(480))
  end
end
