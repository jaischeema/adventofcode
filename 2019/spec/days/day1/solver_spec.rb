# frozen_string_literal: true

require "days"

RSpec.describe Days::Day1::Solver do
  let(:input_file_path) { fixture_file(1) }
  let(:input) { File.readlines(input_file_path) }
  let(:solver) { described_class.new(input: input) }

  describe "#solve_1" do
    subject(:result) { solver.solve_1 }

    it { is_expected.to eq(34_241) }

    context "with solution input" do
      let(:input_file_path) { input_file(1) }

      it { is_expected.to eq(3_425_624) }
    end
  end

  describe "#solve_2" do
    subject(:result) { solver.solve_2 }

    it { is_expected.to eq(51_316) }

    context "with solution input" do
      let(:input_file_path) { input_file(1) }

      it { is_expected.to eq(5_135_558) }
    end
  end
end
