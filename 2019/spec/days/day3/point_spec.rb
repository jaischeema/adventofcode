# frozen_string_literal: true

require "days"

RSpec.describe Days::Day3::Point do
  describe "Comparable" do
    describe "less than" do
      specify do
        expect(described_class.new(1, 1)).to be < described_class.new(-1, -2)
      end
    end

    describe "greater than" do
      specify do
        expect(described_class.new(10, 8)).to be > described_class.new(-5, -8)
      end
    end

    describe "equal" do
      specify do
        expect(described_class.new(1, 2)).to eq(described_class.new(-2, -1))
      end
    end
  end
end
