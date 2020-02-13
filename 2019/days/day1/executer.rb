# frozen_string_literal: true

module Days
  module Day1
    class Executer < Days::Executer
      def solution_1
        solver.solve_1
      end

      def solution_2
        solver.solve_2
      end

      def solver
        @solver ||= Solver.new(input: input)
      end
    end
  end
end
