# frozen_string_literal: true

require "spec_helper"

RSpec.describe Dispatcher do
  context "with zero instructions" do
    it "delivers to the starting location" do
      subject = described_class.new(instructions: [], worker_count: 1)

      subject.dispatch

      expect(subject.houses.to_a).to eq ["0,0"]
    end
  end

  context "with 1 worker" do
    it "passes all instructions to one worker and saves locations" do
      worker = instance_double Worker
      allow(worker).to receive(:move).and_return("0,-1", "0,0")
      allow(Worker).to receive(:new).and_return(worker)
      instructions = ["v", "^"]
      subject = described_class.new(instructions: instructions, worker_count: 1)

      subject.dispatch

      expect(subject.houses.to_a).to eq ["0,0", "0,-1"]
      expect(worker).to have_received(:move).with("v").with("^").ordered
    end
  end

  context "with multiple workers" do
    it "divides the instuctions in order" do
      worker1 = instance_double Worker, move: "0,-1"
      allow(worker1).to receive(:move).and_return("0,-1", "0,0")
      worker2 = instance_double Worker, move: "0,1"
      worker3 = instance_double Worker, move: "1,0"
      allow(Worker).to receive(:new).and_return(worker1, worker2, worker3)
      instructions = ["v", "^", ">", "^"]

      subject = described_class.new(instructions: instructions, worker_count: 3)

      subject.dispatch

      expect(subject.houses.to_a).to match_array ["0,0", "0,-1", "0,1", "1,0"]
      expect(worker1).to have_received(:move).with("v").with("^").ordered
      expect(worker1).to have_received(:move).twice
      expect(worker2).to have_received(:move).with("^")
      expect(worker3).to have_received(:move).with(">")
    end
  end
end
