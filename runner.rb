# frozen_string_literal: true

require_relative "./dispatcher.rb"
require_relative "./summarizer.rb"

filename = ARGV.first || "instructions.txt"
instructions = File.read(filename).split("")

maria = Worker.new("Maria")
clovis = Worker.new("Clovis")
dispatcher = Dispatcher.new(instructions: instructions, workers: [maria, clovis])
dispatcher.dispatch
summarizer = Summarizer.new([maria, clovis])
puts summarizer.summary
puts summarizer.total
