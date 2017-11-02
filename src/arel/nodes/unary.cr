module Arel
  module Nodes
    class Unary < Arel::Nodes::Node
      property :expr
      def value
        expr
      end

      def initialize(@expr : Arel::Nodes::NodesArray)
        super()
      end

      def hash
        @expr.hash
      end

      def eql?(other)
        if(other.is_a?(Arel::Nodes::Unary))
          return other_expr = other.expr
        end
        return false if other.is_a?(Int32)
        self.class == other.class &&
          self.expr == other_expr
      end
      def ==(other)
        eql?(other)
      end
    end

    class Bin < Unary
    end
    class Cube < Unary
    end
    class DistinctOn < Unary
    end
    class Group < Unary
    end
    class GroupingElement < Unary
    end
    class GroupingSet < Unary
    end
    class Limit < Unary
    end
    class Lock < Unary
    end
    class Not < Unary
    end
    class Offset < Unary
    end
    class On < Unary
    end
    class Ordering < Unary
    end
    class RollUp < Unary
    end
    class Top < Unary
    end
  end
end
