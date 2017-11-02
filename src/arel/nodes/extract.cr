# frozen_string_literal: true
module Arel
  module Nodes
    class Extract < Arel::Nodes::Unary
      include Arel::AliasPredication
      include Arel::Predications

      property :field
      @field : Arel::Nodes::NodesArray

      def initialize(expr, field)
        super(expr)
        @field = field
      end

      def hash
        super ^ @field.hash
      end

      def eql?(other)
        if other.is_a?(Extract)
          super &&
            self.field == other.field
        else
          false
        end
      end
      def ==(other)
        eql?(other)
      end
    end
  end
end
