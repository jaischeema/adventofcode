# frozen_string_literal: true

module Days
  class Day2 < Solution
    DEFAULT_OPTIONS = {
      input_preprocessor: proc { |x|
        x[1] = 12
        x[2] = 2
        x
      },
      result_extractor: proc { |x| x.first }
    }.freeze

    ADDITION_OP_CODE = 1
    MULTIPLICACTION_OP_CODE = 2
    EXIT_OP_CODE = 99

    def solve_1
      program = input_preprocessor.call(Array.new(parsed_input))
      program = execute_program(program)
      result_extractor.call(program)
    end

    def solve_2
      original_program = parsed_input
      (0...99).to_a.repeated_permutation(2).each do |noun, verb|
        program = Array.new(original_program)
        program[1] = noun
        program[2] = verb
        program = execute_program(program)

        if program.first == 19_690_720
          return 100 * noun + verb
        end
      end
    end

    private

    def execute_program(instructions)
      instructions.each_slice(4) do |op_code, index1, index2, destination|
        case op_code
        when ADDITION_OP_CODE
          instructions[destination] = instructions[index1] + instructions[index2]
        when MULTIPLICACTION_OP_CODE
          instructions[destination] = instructions[index1] * instructions[index2]
        when EXIT_OP_CODE
          return instructions
        else
          raise "Invalid opcode: #{opcode}"
        end
      end
    end

    def parsed_input
      @parsed_input ||= sanitized_input.split(",").map { |value| Integer(value) }
    end

    def sanitized_input
      input.is_a?(Array) ? input.first : input
    end
  end
end
