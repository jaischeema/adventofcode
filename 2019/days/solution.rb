# frozen_string_literal: true

module Days
  class Solution
    attr_reader :input_file_path

    def initialize(input_file_path: nil, input: nil)
      raise 'Need to provide input_file_path or raw input' if input_file_path.nil? && input.nil?

      @input_file_path = input_file_path
      @input = input
    end

    def solve_1
      raise NotImplementedError
    end

    def solve_2
      raise NotImplementedError
    end

    def input
      return @input unless @input.nil?
      @input = File.readlines(input_file_path)
    end
  end
end
