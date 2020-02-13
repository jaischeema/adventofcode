# frozen_string_literal: true

module Days
  class Day1 < Solution
    def solve
      input.map do |line|
        mass = Integer(line)
        fuel_required_for_module_mass(mass)
      end.reduce(:+)
    end

    private

    def fuel_required_for_module_mass(value)
      (value / 3).round - 2
    end
  end
end
