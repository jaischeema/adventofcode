# frozen_string_literal: true

require "days"

RSpec.describe Days::Day1 do
  let(:solver) { described_class.new(fixture_file(1)) }

  describe "#solve_1" do
    subject(:result) { solver.solve_1 }

    it { is_expected.to eq(34_241) }
  end

  describe "#solve_2" do
    subject(:result) { solver.solve_2 }

    it { is_expected.to eq(51_316) }
  end
end
