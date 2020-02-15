# frozen_string_literal: true

module Days
  module Day3
    Point = Struct.new(:x, :y) do
      include Comparable

      def <=>(other)
        return nil if other.nil?

        (x.abs + y.abs) <=> (other.x.abs + other.y.abs)
      end

      def ==(other)
        return false if other.nil?

        x == other.x && y == other.y
      end
    end
  end
end
