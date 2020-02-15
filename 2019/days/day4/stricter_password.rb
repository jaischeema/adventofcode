# frozen_string_literal: true

module Days
  module Day4
    class StricterPassword < Password
      def repeating_digits?
        grouped_digits.values.any? { |occurrences| occurrences.count == 2 }
      end

      def grouped_digits
        @grouped_digits ||= digits.group_by(&:itself)
      end
    end
  end
end
