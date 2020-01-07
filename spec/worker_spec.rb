# frozen_string_literal: true

require "spec_helper"

RSpec.describe Worker do
  describe "#name" do
    it "returns the name" do
      subject = described_class.new("Maria")
      expect(subject.name).to eq "Maria"
    end
  end

  describe "#move" do
    subject { described_class.new("Maria") }

    context "when invalid instruction passed" do
      it "does not move" do
        expect(subject.move("bad")).to eq "0,0"
      end
    end

    context "moving left" do
      it "decreases x coordinate" do
        expect(subject.move(described_class::LEFT)).to eq "-1,0"
      end
    end

    context "moving right" do
      it "increases x coordinate" do
        expect(subject.move(described_class::RIGHT)).to eq "1,0"
      end
    end

    context "moving up" do
      it "increases y coordinate" do
        expect(subject.move(described_class::UP)).to eq "0,1"
      end
    end

    context "moving down" do
      it "decreases y coordinate" do
        expect(subject.move(described_class::DOWN)).to eq "0,-1"
      end
    end

    it "keeps track of position" do
      expect(subject.move(described_class::DOWN)).to eq "0,-1"
      expect(subject.move(described_class::DOWN)).to eq "0,-2"
      expect(subject.move(described_class::RIGHT)).to eq "1,-2"
      expect(subject.move(described_class::RIGHT)).to eq "2,-2"
      expect(subject.move(described_class::UP)).to eq "2,-1"
      expect(subject.move(described_class::LEFT)).to eq "1,-1"
      expect(subject.move(described_class::UP)).to eq "1,0"
      expect(subject.move(described_class::LEFT)).to eq "0,0"
    end
  end
end
