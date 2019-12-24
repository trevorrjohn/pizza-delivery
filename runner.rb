# frozen_string_literal: true

require_relative "./dispatcher.rb"

instructions = File.read("instructions.txt").split("")

# Part 1
dispatcher1 = Dispatcher.new(instructions: instructions, worker_count: 1)
dispatcher1.dispatch
puts "Part 1: Number of houses using 1 worker: #{dispatcher1.houses.size}"

# Part 2
dispatcher2 = Dispatcher.new(instructions: instructions, worker_count: 2)
dispatcher2.dispatch
puts "Part 2: Number of houses using 2 workers: #{dispatcher2.houses.size}"
