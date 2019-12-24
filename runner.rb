# frozen_string_literal: true

require_relative "./dispatcher.rb"

filename = ARGV.first || "instructions.txt"
instructions = File.read(filename).split("")

[1, 2].each do |workers|
  dispatcher = Dispatcher.new(instructions: instructions, worker_count: workers)
  dispatcher.dispatch
  puts "Number of houses using #{workers} worker: #{dispatcher.houses.size}"
end
