# frozen_string_literal: true

require "days"

RSpec.describe Days::Day2::Program do
  let(:input) { instructions.split(",").map { |x| Integer(x) } }
  let(:program) { described_class.new(input) }

  subject { program.execute }

  context "scenario 1" do
    let(:instructions) { "1,0,0,0,99" }

    it { is_expected.to eq([2, 0, 0, 0, 99]) }
  end

  context "scenario 2" do
    let(:instructions) { "2,3,0,3,99" }

    it { is_expected.to eq([2, 3, 0, 6, 99]) }
  end

  context "scenario 3" do
    let(:instructions) { "2,4,4,5,99,0" }

    it { is_expected.to eq([2, 4, 4, 5, 99, 9801]) }
  end

  context "scenario 4" do
    let(:instructions) { "1,1,1,4,99,5,6,0,99" }

    it { is_expected.to eq([30, 1, 1, 4, 2, 5, 6, 0, 99]) }
  end
end
