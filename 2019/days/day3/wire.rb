# frozen_string_literal: true

module Days
  module Day3
    class Wire
      attr_reader :moves

      def initialize(moves)
        @moves = moves.map { |x| Move.new(x) }
      end

      def path
        @path ||= begin
                    moves.reduce([]) do |result, move|
                      points = move.apply(result.last || Point.new(0, 0))
                      result + points
                    end
                  end
      end

      def steps(to:)
        path.find_index(to) + 1
      end
    end
  end
end
