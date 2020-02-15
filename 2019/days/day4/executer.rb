# frozen_string_literal: true

module Days
  module Day4
    class Executer < Days::Executer
      def solution_1
        solver.solve_1.count
      end

      def solution_2
        solver.solve_2.count
      end

      def solver
        @solver ||= Solver.new(input: input_range)
      end

      def input_range
        values = input.first.split("-").map { |x| Integer(x) }
        values.first...values.last
      end
    end
  end
end
