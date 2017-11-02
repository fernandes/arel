require "../attributes/attribute"

module Arel
  module Nodes
    class Binary < Arel::Nodes::Node
      property :left, :right
      @left : (String? | Arel::Attributes::Attribute | Arel::Nodes::Node)
      # @right : Array(String) | String | Arel::Nodes::Node | Int32
      @right : Arel::Nodes::SqlLiteral | Arel::Nodes::Node | String

      def initialize(left, right)
        super()
        @left  = left
        @right = right
      end

      def initialize_copy(other)
        super
        @left  = @left.clone if @left
        @right = @right.clone if @right
      end

      def hash
        [self.class, @left, @right].hash
      end

      def eql?(other)
        if other.is_a?(Binary)
          self.class == other.class &&
            self.left == other.left &&
            self.right == other.right
        else
          false
        end
      end
      def ==(other)
        eql?(other)
      end
    end

    class As < Binary
    end
    class Assignment < Binary
    end
    class Between < Binary
    end
    class GreaterThan < Binary
    end
    class GreaterThanOrEqual < Binary
    end
    class Join < Binary
    end
    class LessThan < Binary
    end
    class LessThanOrEqual < Binary
    end
    class NotEqual < Binary
    end
    class NotIn < Binary
    end
    class Or < Binary
    end
    class Union < Binary
    end
    class UnionAll < Binary
    end
    class Intersect < Binary
    end
    class Except < Binary
    end
  end
end
