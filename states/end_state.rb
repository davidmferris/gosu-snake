require 'singleton'

class EndState < GameState
  include Singleton

  def initialize
    @message = Gosu::Image.from_text(
      $window, "Game Over",
      Gosu.default_font_name, 100)
  end

  def enter
  end

  def leave
  end

  def draw
    @message.draw(
      $window.width / 2 - @message.width / 2,
      $window.height / 2 - @message.height / 2,
      10)
  end
end
