# frozen_string_literal: true

module Days
  module Day1
    class Solver < Days::Solver
      def solve_1
        input.map do |line|
          mass_value = Integer(line)
          Mass.new(mass_value).fuel_required_for_base_only
        end.reduce(:+)
      end

      def solve_2
        input.map do |line|
          mass_value = Integer(line)
          Mass.new(mass_value).total_fuel_required
        end.reduce(:+)
      end
    end
  end
end
