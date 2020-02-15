# frozen_string_literal: true

module Days
  module Day4
    class Executer < Days::Executer
      def solution_1
        solver.solve_1.count
        # closed_point = solver.solve_1
        # closed_point.x.abs + closed_point.y.abs
      end

      def solution_2
        # solver.solve_2
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
