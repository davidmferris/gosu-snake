require 'gosu'
require_relative 'snake'
require_relative 'apple'
require_relative './states/game_state'
require_relative './states/end_state'
require_relative './states/play_state'

class GameWindow < Gosu::Window

  attr_accessor :state

  def initialize(height, width)
    super
    self.caption = "Snake"
  end

  def update
    @state.update
  end

  def draw
    @state.draw
  end

  def needs_redraw?
    @state.needs_redraw?
  end

  def button_down(id)
    @state.button_down(id)
  end
end

$window = GameWindow.new(640, 480)
GameState.switch(PlayState.instance)
$window.show
