# frozen_string_literal: true

module Days
  module Day3
    class Solver < Days::Solver
      def solve_1
        intersections.min
      end

      def solve_2
        intersections.map do |point|
          wire1.steps(to: point) + wire2.steps(to: point)
        end.min
      end

      private

      def wires
        @wires ||= parsed_input.map { |moves| Wire.new(moves) }
      end

      def wire1
        wires.first
      end

      def wire2
        wires.last
      end

      def intersections
        wire1.path & wire2.path
      end

      def parsed_input
        @parsed_input ||= input.map { |line| line.split(",") }
      end
    end
  end
end
