# frozen_string_literal: true

module Days
  module Day2
    class Executer < Days::Executer
      def solution_1
        solver.solve_1(noun: 12, verb: 2).first
      end

      def solution_2
        noun, verb = solver.solve_2(for_value: 19_690_720)
        100 * noun + verb
      end

      def solver
        @solver ||= Solver.new(input: input)
      end
    end
  end
end
