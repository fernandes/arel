# frozen_string_literal: true
module Arel
  module Nodes
    # TODO: Cannot inherit from String
    # So creating a Class and check what methods are called, to replicate
    # the String behavior
    class SqlLiteral
      include Arel::Expressions
      include Arel::Predications
      include Arel::AliasPredication
      include Arel::OrderPredications

      @value : String
      delegate :size, :to_i, :to_f, :to_s, :to_json, to: @value
      forward_missing_to @value

      def initialize(value)
        @value = value.to_s
      end

      def encode_with(coder)
        coder.scalar = self.to_s
      end

      def inspect(io : IO)
        @value.to_s(io)
      end

      def ==(other)
        @value == other
      end
      def eql?(other)
        self.==(other)
      end
    end
  end
end
