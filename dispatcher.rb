# frozen_string_literal: true

require "set"
require_relative "./worker.rb"

class Dispatcher
  attr_reader :houses

  def initialize(instructions:, worker_count:)
    @instructions = instructions
    @worker_count = worker_count
    @houses = Set["0,0"]
  end

  def dispatch
    instructions.each.with_index do |direction, i|
      houses.add(workers[i % workers.size].move(direction))
    end
  end

  private

  attr_reader :instructions, :worker_count

  def workers
    @workers ||= worker_count.times.map { Worker.new }
  end
end
