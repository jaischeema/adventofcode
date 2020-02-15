# frozen_string_literal: true

module Days
  module Day4
    class Password
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def valid?
        digits_in_increasing_order? && repeating_digits?
      end

      private

      def digits_in_increasing_order?
        digits.each_cons(2).all? do |digit1, digit2|
          digit1 <= digit2
        end
      end

      def repeating_digits?
        digits.each_cons(2).any? do |digit1, digit2|
          digit1 == digit2
        end
      end

      def digits
        @digits ||= value.to_s.split("").map { |x| Integer(x) }
      end
    end
  end
end
