# frozen_string_literal: true

require "days"

RSpec.describe Days::Day3::Solver do
  let(:solver) { described_class.new(input: input) }
  let(:input) { ["R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83"] }

  describe "#solve_1" do
    subject(:result) { solver.solve_1 }

    it { is_expected.to eq(Days::Day3::Point.new(155, -4)) }
  end

  describe "#solve_2" do
    subject { solver.solve_2 }

    context "scenario 1" do
      let(:input) do
        ["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"]
      end

      it { is_expected.to eq(410) }
    end

    context "scenario 1" do
      let(:input) do
        ["R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83"]
      end

      it { is_expected.to eq(610) }
    end
  end
end
