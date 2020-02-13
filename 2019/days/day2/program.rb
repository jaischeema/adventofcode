# frozen_string_literal: true

module Days
  module Day2
    class Program
      ADDITION_OP_CODE = 1
      MULTIPLICACTION_OP_CODE = 2
      EXIT_OP_CODE = 99

      class InvalidOpcode < StandardError; end

      attr_reader :instructions

      def initialize(instructions)
        @instructions = instructions
      end

      # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      def execute
        instructions.each_slice(4) do |op_code, index1, index2, destination|
          case op_code
          when ADDITION_OP_CODE
            instructions[destination] = instructions[index1] + instructions[index2]
          when MULTIPLICACTION_OP_CODE
            instructions[destination] = instructions[index1] * instructions[index2]
          when EXIT_OP_CODE
            return instructions
          else
            raise InvalidOpcode, op_code
          end
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
    end
  end
end
