# frozen_string_literal: true
module Arel
  module Nodes
    class Equality < Arel::Nodes::Binary
      def operator; :== end
      def operand1
        left
      end

      def operand2
        right
      end
    end
  end
end
