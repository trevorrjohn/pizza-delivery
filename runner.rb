# frozen_string_literal: true

require_relative "./dispatcher.rb"
require_relative "./summarizer.rb"

filename = ARGV.shift || "instructions.txt"
instructions = File.read(filename).split("")
names = ARGV.any? ? ARGV : %w[Maria Clovis]

workers = names.map { |name| Worker.new(name) }
dispatcher = Dispatcher.new(instructions: instructions, workers: workers)
dispatcher.dispatch
summarizer = Summarizer.new(workers)
puts summarizer.summary
puts summarizer.total
