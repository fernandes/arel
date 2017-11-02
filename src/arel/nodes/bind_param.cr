# frozen_string_literal: true
module Arel
  module Nodes
    class BindParam < Node
      @value : String # TODO: check
      property :value

      def initialize(value)
        @value = value
        super()
      end

      def hash
        [self.class, self.value].hash
      end

      def eql?(other)
        other.is_a?(BindParam) &&
          value == other.value
      end
      def ==(other)
        eql?(other)
      end

      # TODO: nil? -> is_nil?
      def is_nil?
        value.nil?
      end
    end
  end
end
