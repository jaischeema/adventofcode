# frozen_string_literal: true

require "days"

RSpec.describe Days::Day3::Move do
  let(:move) { described_class.new(value) }
  let(:starting_point) { Days::Day3::Point.new(starting_x, starting_y) }
  let(:starting_x) { 2 }
  let(:starting_y) { 5 }

  describe "#apply" do
    subject { move.apply(starting_point).map { |point| [point.x, point.y] } }

    context "up" do
      let(:value) { "U2" }

      it { is_expected.to eq([[2, 4], [2, 3]]) }
    end

    context "down" do
      let(:value) { "D2" }

      it { is_expected.to eq([[2, 6], [2, 7]]) }
    end

    context "left" do
      let(:value) { "L3" }

      it { is_expected.to eq([[1, 5], [0, 5], [-1, 5]]) }
    end

    context "right" do
      let(:value) { "R3" }

      it { is_expected.to eq([[3, 5], [4, 5], [5, 5]]) }
    end
  end
end
