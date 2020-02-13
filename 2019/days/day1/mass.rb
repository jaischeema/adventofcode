# frozen_string_literal: true

module Days
  module Day1
    class Mass
      def initialize(value)
        @value = value
      end

      def fuel_required_for_base_only
        (value / 3).round - 2
      end

      def total_fuel_required
        base_fuel = fuel_required_for_base_only
        return 0 unless base_fuel.positive?

        fuel_required_for_fuel = Mass.new(base_fuel).total_fuel_required
        base_fuel + fuel_required_for_fuel
      end

      private

      attr_reader :value
    end
  end
end
