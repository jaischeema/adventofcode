# frozen_string_literal: true

module Days
  module Day3
    class Executer < Days::Executer
      def solution_1
        closed_point = solver.solve_1
        closed_point.x.abs + closed_point.y.abs
      end

      def solution_2
      end

      def solver
        @solver ||= Solver.new(input: input)
      end
    end
  end
end
