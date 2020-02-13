# frozen_string_literal: true

require "days"

RSpec.describe Days::Day2 do
  let(:input_preprocessor) { proc { |x| x } }
  let(:result_extractor) { proc { |x| x } }
  let(:options) { { input_preprocessor: input_preprocessor, result_extractor: result_extractor } }
  let(:solver) { described_class.new(input: input, options: options) }

  describe "#solve_1" do
    subject(:result) { solver.solve_1 }

    context "scenario 1" do
      let(:input) { "1,0,0,0,99" }

      it { is_expected.to eq([2, 0, 0, 0, 99]) }
    end

    context "scenario 2" do
      let(:input) { "2,3,0,3,99" }

      it { is_expected.to eq([2, 3, 0, 6, 99]) }
    end

    context "scenario 3" do
      let(:input) { "2,4,4,5,99,0" }

      it { is_expected.to eq([2, 4, 4, 5, 99, 9801]) }
    end

    context "scenario 4" do
      let(:input) { "1,1,1,4,99,5,6,0,99" }

      it { is_expected.to eq([30, 1, 1, 4, 2, 5, 6, 0, 99]) }
    end

    context "with solution input" do
      let(:input_file_path) { input_file(2) }
      let(:solver) { described_class.new(input_file_path: input_file_path) }

      it { is_expected.to eq(4_945_026) }
    end
  end
end
