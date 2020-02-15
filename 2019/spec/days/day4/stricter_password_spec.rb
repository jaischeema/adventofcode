# frozen_string_literal: true

require "days"

RSpec.describe Days::Day4::StricterPassword do
  let(:password) { described_class.new(value) }

  describe "#valid?" do
    subject { password.valid? }

    context "112233" do
      let(:value) { 112_233 }

      it { is_expected.to be true }
    end

    context "123444" do
      let(:value) { 123_444 }

      it { is_expected.to be false }
    end

    context "111122" do
      let(:value) { 111_122 }

      it { is_expected.to be true }
    end

    context "111123" do
      let(:value) { 111_123 }

      it { is_expected.to be false }
    end
  end
end
