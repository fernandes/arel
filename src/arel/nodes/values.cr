# frozen_string_literal: true
module Arel
  module Nodes
    class Values < Arel::Nodes::Binary
      def expressions
        left
      end

      def expressions=(value)
        left=(value)
      end

      def columns
        right
      end

      def columns=(value)
        right=(value)
      end

      def initialize(exprs, columns = [] of String)
        super
      end
    end
  end
end
