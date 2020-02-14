# frozen_string_literal: true

module Days
  module Day3
    class Move
      UP = "U"
      DOWN = "D"
      LEFT = "L"
      RIGHT = "R"

      attr_reader :direction, :distance

      def initialize(value)
        tokens = value.split("")
        @direction = tokens.shift
        @distance = Integer(tokens.join)
      end

      def apply(starting_point) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        new_point_proc =
          case direction
          when UP
            proc { |count| Point.new(starting_point.x, starting_point.y - (count + 1)) }
          when DOWN
            proc { |count| Point.new(starting_point.x, starting_point.y + (count + 1)) }
          when LEFT
            proc { |count| Point.new(starting_point.x - (count + 1), starting_point.y) }
          when RIGHT
            proc { |count| Point.new(starting_point.x + (count + 1), starting_point.y) }
          end

        distance.times.map(&new_point_proc)
      end
    end
  end
end
