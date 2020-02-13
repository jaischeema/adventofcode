# frozen_string_literal: true

module Days
  class Day1 < Solution
    def solve_1
      input.map do |line|
        mass = Integer(line)
        fuel_required_for_module_mass(mass)
      end.reduce(:+)
    end

    def solve_2
      input.map do |line|
        mass = Integer(line)
        fuel_required_for_module_mass_recursive(mass)
      end.reduce(:+)
    end

    private

    def fuel_required_for_module_mass(value)
      (value / 3).round - 2
    end

    def fuel_required_for_module_mass_recursive(value)
      values = []
      fuel_required = fuel_required_for_module_mass(value)
      while fuel_required.positive?
        values << fuel_required
        fuel_required = fuel_required_for_module_mass(fuel_required)
      end
      values.reduce(:+)
    end
  end
end
