# frozen_string_literal: true
module Arel
  module Nodes
    class Function < Arel::Nodes::Node
      include Arel::Predications
      include Arel::WindowPredications
      include Arel::OrderPredications
      property :expressions, :alias, :distinct
      @expressions : String # TODO: check
      @alias : String # TODO: check

      def initialize(expr, aliaz = nil)
        super()
        @expressions = expr
        # TODO: infer nil
        @alias       = aliaz && SqlLiteral.new(aliaz)
        @distinct    = false
      end

      def node_as(aliaz)
        self.alias = SqlLiteral.new(aliaz)
        self
      end

      def hash
        [@expressions, @alias, @distinct].hash
      end

      def eql?(other)
        if other.is_a?(Function)
          self.class == other.class &&
            self.expressions == other.expressions &&
            self.alias == other.alias &&
            self.distinct == other.distinct
        else
          false
        end
      end
      def ==(other)
        eql?(other)
      end
    end

    class Sum < Function
    end

    class Exists < Function
    end

    class Max < Function
    end

    class Min < Function
    end

    class Avg < Function
    end
  end
end
