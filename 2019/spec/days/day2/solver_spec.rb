# frozen_string_literal: true

require "days"

RSpec.describe Days::Day2::Solver do
  let(:solver) { described_class.new(input: input) }
  let(:input) { "1,1,1,4,99,1,1,0,99" }

  describe "#solve_1" do
    subject(:result) { solver.solve_1(noun: 5, verb: 6) }

    it { is_expected.to eq([25, 5, 6, 4, 2, 1, 1, 0, 99]) }
  end

  describe "#solve_2" do
    let(:input_file_path) { input_file(2) }
    let(:input) { File.readlines(input_file_path) }
    subject(:result) { solver.solve_2(for_value: 19_690_720) }

    it { is_expected.to eq([52, 96]) }
  end
end
