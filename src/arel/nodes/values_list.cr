# frozen_string_literal: true
module Arel
  module Nodes
    class ValuesList < Node
      getter :rows

      def initialize(rows)
        @rows = rows
        super()
      end

      def hash
        @rows.hash
      end

      def eql?(other)
        self.class == other.class &&
          self.rows == other.rows
      end
      def ==(other)
        eql?(other)
      end
    end
  end
end
