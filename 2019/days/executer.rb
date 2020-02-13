# frozen_string_literal: true

module Days
  class Executer
    attr_reader :input_file_path

    def initialize(input_file_path:)
      @input_file_path = input_file_path
    end

    def solution_1
      raise NotImplementedError
    end

    def solution_2
      raise NotImplementedError
    end

    protected

    def input
      @input ||= File.readlines(input_file_path)
    end
  end
end
