# frozen_string_literal: true
module Arel
  module Nodes
    class DeleteStatement < Arel::Nodes::Binary
      property :limit

      def relation
        left
      end

      def relation=(value)
        left=(value)
      end

      def wheres
        right
      end

      def wheres=(value)
        right=(value)
      end

      def initialize (relation = nil, wheres = [] of String)
        super
      end

      def initialize_copy(other)
        super
        @right = @right.clone
      end
    end
  end
end
