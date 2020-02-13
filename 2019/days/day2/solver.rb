# frozen_string_literal: true

module Days
  module Day2
    class Solver < Days::Solver
      def solve_1(noun:, verb:, instructions: input_instructions)
        instructions[1] = noun
        instructions[2] = verb
        program = Program.new(instructions)
        program.execute
      rescue Program::InvalidOpcode
        input_instructions
      end

      def solve_2(for_value:)
        instructions = input_instructions
        (0...99).to_a.repeated_permutation(2).each do |noun, verb|
          instructions = solve_1(noun: noun, verb: verb, instructions: instructions)
          return [noun, verb] if instructions.first == for_value
        end
      end

      private

      def input_instructions
        Array.new(parsed_input)
      end

      def parsed_input
        @parsed_input ||= sanitized_input.split(",").map { |value| Integer(value) }
      end

      def sanitized_input
        input.is_a?(Array) ? input.first : input
      end
    end
  end
end
