# frozen_string_literal: true

require "days"

RSpec.describe Days::Day1 do
  let(:solution) { described_class.new(fixture_file(1)) }

  subject(:result) { solution.solve }

  it { is_expected.to eq(34_241) }
end
