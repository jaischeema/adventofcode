# frozen_string_literal: true

module Days
  module Day4
    class Solver < Days::Solver
      def solve_1
        input.select do |value|
          Password.new(value).valid?
        end
      end

      def solve_2
      end
    end
  end
end
