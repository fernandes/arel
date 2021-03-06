# frozen_string_literal: true
module Arel
  module Nodes
    class Case < Arel::Nodes::Node
      include Arel::OrderPredications
      include Arel::Predications
      include Arel::AliasPredication

      @case : Arel::Nodes::NodesArray
      @default : Arel::Nodes::When | Arel::Nodes::Quoted | Nil | String
      property :case, :conditions, :default

      def initialize(expression = nil, default = nil)
        # TODO: infer nil
        @case = expression
        @conditions = [] of Arel::Nodes::When
        # TODO: infer nil
        @default = default
      end

      def when(condition, expression = nil)
        @conditions << When.new(Nodes.build_quoted(condition), expression)
        self
      end

      def then(expression)
        @conditions.last.right = Nodes.build_quoted(expression)
        self
      end

      def else(expression)
        @default = Else.new Nodes.build_quoted(expression)
        self
      end

      def initialize_copy(other)
        super
        @case = @case.clone if @case
        @conditions = @conditions.map { |x| x.clone }
        @default = @default.clone if @default
      end

      def hash
        [@case, @conditions, @default].hash
      end

      def eql?(other)
        if other.is_a?(Case)
          self.class == other.class &&
            self.case == other.case &&
            self.conditions == other.conditions &&
            self.default == other.default
        else
          false
        end
      end
      def ==(other)
        eql?(other)
      end
    end

    class When < Binary # :nodoc:
    end

    class Else < Unary # :nodoc:
    end
  end
end
