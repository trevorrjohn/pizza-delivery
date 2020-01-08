# frozen_string_literal: true

require "set"

class Worker
  UP    = "^".freeze
  DOWN  = "v".freeze
  LEFT  = "<".freeze
  RIGHT = ">".freeze

  attr_reader :name, :houses

  def initialize(name)
    @name = name
    @x = 0
    @y = 0
    @houses = Set["0,0"]
  end

  def move(direction)
    update_position(direction)
    new_position = "#{x},#{y}"
    houses.add(new_position)
    new_position
  end

  private

  attr_reader :x, :y

  def update_position(direction)
    case direction
    when UP
      @y += 1
    when DOWN
      @y -= 1
    when RIGHT
      @x += 1
    when LEFT
      @x -= 1
    end
  end
end
