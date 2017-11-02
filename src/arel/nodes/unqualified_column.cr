# frozen_string_literal: true
module Arel
  module Nodes
    class UnqualifiedColumn < Arel::Nodes::Unary
      def attribute
        expr
      end

      def attribute=(value)
        expr=(value)
      end

      def relation
        @expr.relation
      end

      def column
        @expr.column
      end

      def name
        if @expr.is_a?(Arel::Nodes::Node)
          @expr.name
        end
      end
    end
  end
end
