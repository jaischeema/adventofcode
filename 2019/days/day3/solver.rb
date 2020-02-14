# frozen_string_literal: true

module Days
  module Day3
    class Solver < Days::Solver
      def solve_1
        wire1 = wires.first
        wire2 = wires.last

        intersection = wire1.path & wire2.path
        intersection.min
      end

      def solve_2
      end

      private

      def wires
        @wires ||= parsed_input.map { |moves| Wire.new(moves) }
      end

      def parsed_input
        @parsed_input ||= input.map { |line| line.split(",") }
      end
    end
  end
end
