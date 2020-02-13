# frozen_string_literal: true

require "days"

RSpec.describe Days::Day1::Mass do
  let(:value) { 100 }
  let(:mass) { described_class.new(value) }

  describe "#total_fuel_required" do
    subject { mass.total_fuel_required }

    it { is_expected.to eq(39) }
  end

  describe "#fuel_required_for_base_only" do
    subject { mass.fuel_required_for_base_only }

    it { is_expected.to eq(31) }
  end
end
