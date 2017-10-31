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

      def encode_with(coder)
        coder.scalar = self.to_s
      end
    end
  end
end
