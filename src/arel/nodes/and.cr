# frozen_string_literal: true
module Arel
  module Nodes
    class And < Arel::Nodes::Node
      @children : Array(Arel::Nodes::NodesArray)
      getter :children

      def initialize(children)
        super()
        @children = children
      end

      def left
        children.first
      end

      def right
        children[1]
      end

      def hash
        children.hash
      end

      def eql?(other)
        if other.is_a?(And)
          self.class == other.class &&
            self.children == other.children
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
