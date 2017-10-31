# frozen_string_literal: true
module Arel
  module Nodes
    class Extract < Arel::Nodes::Unary
      include Arel::AliasPredication
      include Arel::Predications

      property :field

      def initialize(expr, field)
        super(expr)
        @field = field
      end

      def hash
        super ^ @field.hash
      end

      def eql?(other)
        super &&
          self.field == other.field
      end
      def ==(other)
        eql?(other)
      end
    end
  end
end
