# frozen_string_literal: true

require "set"

RSpec.describe Summarizer do
  describe "#total" do
    context "with no workers" do
      it "returns 0 houses" do
        expect(described_class.new([]).total).to eq "For a total of 0 houses"
      end
    end

    context "with workers" do
      it "takes the set product of the houses" do
        maria = instance_double Worker, name: "Maria", houses: Set["0,0", "0,2"]
        clovis = instance_double Worker, name: "Clovis", houses: Set["0,0"]

        subject = described_class.new([maria, clovis])

        expect(subject.total).to eq "For a total of 2 houses"
      end
    end
  end

  describe "#summary" do
    context "with no workers" do
      it "returns empty array" do
        expect(described_class.new([]).summary).to eq []
      end
    end

    context "when worker has delivered to 1 home" do
      it "displays name and home" do
        worker = instance_double Worker, name: "Maria", houses: Set["0,0"]

        subject = described_class.new([worker])

        expect(subject.summary).to eq ["Maria delivered to 1 home"]
      end
    end

    context "when worker has delivered to multiple houses" do
      it "displays name and houses" do
        worker = instance_double Worker, name: "Maria", houses: Set["0,0", "0,2"]

        subject = described_class.new([worker])

        expect(subject.summary).to eq ["Maria delivered to 2 houses"]
      end
    end

    context "when multiple workers" do
      it "maps each workers display" do
        maria = instance_double Worker, name: "Maria", houses: Set["0,0", "0,2"]
        clovis = instance_double Worker, name: "Clovis", houses: Set["0,0"]

        subject = described_class.new([maria, clovis])

        expect(subject.summary).to eq([
          "Maria delivered to 2 houses", "Clovis delivered to 1 home"
        ])
      end
    end
  end
end
