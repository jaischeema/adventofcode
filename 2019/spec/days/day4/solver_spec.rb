# frozen_string_literal: true

require "days"

RSpec.describe Days::Day4::Solver do
  let(:solver) { described_class.new(input: input) }
  let(:input) { 111_111...111_120 }

  describe "#solve_1" do
    subject { solver.solve_1 }

    let(:expected_result) do
      [111_111, 111_112, 111_113, 111_114, 111_115, 111_116, 111_117, 111_118, 111_119]
    end

    it { is_expected.to eq(expected_result) }
  end

  describe "#solve_2" do
    subject { solver.solve_2 }

    let(:expected_result) { [111_111] }

    it { is_expected.to eq(expected_result) }
  end
end
