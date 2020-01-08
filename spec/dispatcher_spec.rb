# frozen_string_literal: true

require "spec_helper"

RSpec.describe Dispatcher do
  context "with no workers" do
    it "does not process instructions" do
      subject = described_class.new(instructions: ["^"], workers: [])

      subject.dispatch

      expect(subject.houses).to contain_exactly "0,0"
    end
  end

  context "with zero instructions" do
    it "delivers to the starting location" do
      workers = [Worker.new("Maria")]
      subject = described_class.new(instructions: [], workers: workers)

      subject.dispatch

      expect(subject.houses).to contain_exactly "0,0"
    end
  end

  context "with 1 worker" do
    it "passes all instructions to one worker and saves locations" do
      worker = instance_double Worker
      allow(worker).to receive(:move).and_return("0,-1", "0,0")
      instructions = ["v", "^"]
      subject = described_class.new(instructions: instructions, workers: [worker])

      subject.dispatch

      expect(subject.houses).to contain_exactly "0,0", "0,-1"
      expect(worker).to have_received(:move).with("v").with("^").ordered
    end
  end

  context "with multiple workers" do
    it "divides the instuctions in order" do
      worker1 = instance_double Worker, move: "0,-1"
      allow(worker1).to receive(:move).and_return("0,-1", "0,0")
      worker2 = instance_double Worker, move: "0,1"
      worker3 = instance_double Worker, move: "1,0"
      workers = [ worker1, worker2, worker3 ]
      instructions = ["v", "^", ">", "^"]

      subject = described_class.new(instructions: instructions, workers: workers)

      subject.dispatch

      expect(subject.houses).to contain_exactly "0,0", "0,-1", "0,1", "1,0"
      expect(worker1).to have_received(:move).with("v").with("^").ordered
      expect(worker1).to have_received(:move).twice
      expect(worker2).to have_received(:move).with("^")
      expect(worker3).to have_received(:move).with(">")
    end
  end
end
