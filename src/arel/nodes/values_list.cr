# frozen_string_literal: true
module Arel
  module Nodes
    class ValuesList < Node
      @rows = Array # TODO: check
      getter :rows

      def initialize(rows)
        @rows = rows
        super()
      end

      def hash
        @rows.hash
      end

      def eql?(other)
        if other.is_a?(ValuesList)
          self.class == other.class &&
            self.rows == other.rows
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
