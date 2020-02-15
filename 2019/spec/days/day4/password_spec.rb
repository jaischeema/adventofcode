# frozen_string_literal: true

require "days"

RSpec.describe Days::Day4::Password do
  let(:password) { described_class.new(value) }

  describe "#valid?" do
    subject { password.valid? }

    context "111111" do
      let(:value) { 111_111 }

      it { is_expected.to be true }
    end

    context "223450" do
      let(:value) { 223_450 }

      it { is_expected.to be false }
    end

    context "123789" do
      let(:value) { 123_789 }

      it { is_expected.to be false }
    end
  end
end
