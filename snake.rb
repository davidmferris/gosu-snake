require_relative 'segment'

class Snake
  attr_accessor :x, :y, :score

  def initialize
    @direction = :right
    @x = 200
    @y = 200
    @segments = initial_segments
    @score = 0
  end

  def initial_segments
    segments = []

    50.times do
      segments << new_segment(@x, @y)
    end

    segments
  end

  def new_segment(x, y)
    Segment.new($window, x, y)
  end

  def change_direction(direction)
    @direction = direction
  end

  def move
    case @direction
    when :right
      @x += 5
    when :left
      @x -= 5
    when :up
      @y -= 5
    when :down
      @y += 5
    end
  end

  def increase_length
    @segments.unshift(new_segment(@segments.last.x - 20, @segments.last.y))
  end

  def update_segments
    @segments.shift
    @segments << Segment.new($window, @x + 10, @y)
  end

  def draw
    @segments.each { |segment| segment.draw }
  end

  def ate_apple(apples)
    if apples.reject! {|apple| Gosu::distance(@x, @y, apple.x, apple.y) < 15 } then
      @score += 1
    end
  end

  def hit_wall?
    conditions = [x < 0, x > 640, y < 0, y > 480]
    conditions.any?
  end
end
