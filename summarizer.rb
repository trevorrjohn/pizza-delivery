# frozen_string_literal: true

require "set"

class Summarizer
  def initialize(workers)
    @workers = workers
  end

  def summary
    worker_counts.map {|name, houses| display(name, houses.size) }
  end

  def total
    houses = worker_counts.inject(Set.new) { |product, (_, set)| product + set }
    "For a total of #{houses.size} #{homes(houses.size)}"
  end

  private

  attr_reader :workers

  def worker_counts
    @worker_counts ||= workers
      .map { |worker| [worker.name, worker.houses] }
  end

  def display(name, houses)
    "#{name} delivered to #{houses} #{homes(houses)}"
  end

  def homes(houses)
    houses == 1 ? "home" : "houses"
  end
end
