# frozen_string_literal: true

require "days"

RSpec.describe Days::Day3::Solver do
  let(:solver) { described_class.new(input: input) }
  let(:input) { ["R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83"] }

  describe "#solve_1" do
    subject(:result) { solver.solve_1 }

    it { is_expected.to eq(Days::Day3::Point.new(155, -4)) }
  end
end
