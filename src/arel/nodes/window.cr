# frozen_string_literal: true
module Arel
  module Nodes
    class Window < Arel::Nodes::Node
      property :orders, :framing, :partitions

      def initialize
        @orders = [] of String
        @partitions = [] of String
        # TODO: infer nil
        # @framing = nil
      end

      def order(*expr)
        # FIXME: We SHOULD NOT be converting these to SqlLiteral automatically
        @orders.concat expr.map { |x|
          String === x || Symbol === x ? Nodes::SqlLiteral.new(x.to_s) : x
        }
        self
      end

      def partition(*expr)
        # FIXME: We SHOULD NOT be converting these to SqlLiteral automatically
        @partitions.concat expr.map { |x|
          String === x || Symbol === x ? Nodes::SqlLiteral.new(x.to_s) : x
        }
        self
      end

      def frame(expr)
        @framing = expr
      end

      def rows(expr = nil)
        if @framing
          Rows.new(expr)
        else
          frame(Rows.new(expr))
        end
      end

      def range(expr = nil)
        if @framing
          Range.new(expr)
        else
          frame(Range.new(expr))
        end
      end

      def initialize_copy(other)
        super
        @orders = @orders.map { |x| x.clone }
      end

      def hash
        [@orders, @framing].hash
      end

      def eql?(other)
        self.class == other.class &&
          self.orders == other.orders &&
          self.framing == other.framing &&
          self.partitions == other.partitions
      end
      def ==(other)
        eql?(other)
      end
    end

    class NamedWindow < Window
      property :name

      def initialize(name)
        super()
        @name = name
      end

      def initialize_copy(other)
        super
        @name = other.name.clone
      end

      def hash
        super ^ @name.hash
      end

      def eql?(other)
        super && self.name == other.name
      end
      def ==(other)
        eql?(other)
      end
    end

    class Rows < Unary
      def initialize(expr = nil)
        super(expr)
      end
    end

    class Range < Unary
      def initialize(expr = nil)
        super(expr)
      end
    end

    class CurrentRow < Node
      def hash
        self.class.hash
      end

      def eql?(other)
        self.class == other.class
      end
      def ==(other)
        eql?(other)
      end
    end

    class Preceding < Unary
      def initialize(expr = nil)
        super(expr)
      end
    end

    class Following < Unary
      def initialize(expr = nil)
        super(expr)
      end
    end
  end
end
