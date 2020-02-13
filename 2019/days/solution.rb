# frozen_string_literal: true

module Days
  class Solution
    attr_reader :input_file_path

    def initialize(input_file_path)
      @input_file_path = input_file_path
    end

    def solve
      raise NotImplementedError
    end

    def input
      @input ||= File.readlines(input_file_path)
    end
  end
end
