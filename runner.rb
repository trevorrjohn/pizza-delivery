# frozen_string_literal: true

require_relative "./dispatcher.rb"

filename = ARGV.first || "instructions.txt"
instructions = File.read(filename).split("")

maria = Worker.new("Maria")
clovis = Worker.new("Clovis")
dispatcher = Dispatcher.new(instructions: instructions, workers: [maria, clovis])
dispatcher.dispatch
puts "Number of houses using 2 workers: #{dispatcher.houses.size}"
