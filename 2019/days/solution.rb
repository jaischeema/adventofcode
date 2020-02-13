# frozen_string_literal: true

module Days
  class Solution
    DEFAULT_OPTIONS = {}.freeze

    attr_reader :input_file_path, :options

    def initialize(input_file_path: nil, input: nil, options: {})
      raise "Need to provide input_file_path or raw input" if input_file_path.nil? && input.nil?

      @input_file_path = input_file_path
      @input = input
      @options = self.class::DEFAULT_OPTIONS.merge(options)
    end

    def solve_1
      raise NotImplementedError
    end

    def solve_2
      raise NotImplementedError
    end

    def input_preprocessor
      options.fetch(:input_preprocessor, proc { |x| x })
    end

    def result_extractor
      options.fetch(:result_extractor, proc { |x| x })
    end

    def input
      return @input unless @input.nil?

      @input = File.readlines(input_file_path)
    end
  end
end
