# frozen_string_literal: true

require "days"

RSpec.describe Days::Day3::Wire do
  let(:wire) { described_class.new(moves) }
  let(:moves) { "U2,R7,D3,L2".split(",") }

  describe "#path" do
    subject { wire.path }

    let(:points) do
      [
        [0, -1],
        [0, -2],
        [1, -2],
        [2, -2],
        [3, -2],
        [4, -2],
        [5, -2],
        [6, -2],
        [7, -2],
        [7, -1],
        [7, 0],
        [7, 1],
        [6, 1],
        [5, 1]
      ].map { |x, y| Days::Day3::Point.new(x, y) }
    end

    it { is_expected.to eq(points) }
  end
end
