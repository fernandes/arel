# frozen_string_literal: true
module Arel
  module Nodes
    class Casted < Arel::Nodes::Node # :nodoc:
      @val : Arel::Nodes::NodesArray
      @attribute : Arel::Nodes::NodesArray

      getter :val, :attribute
      def initialize(val, attribute)
        @val       = val
        @attribute = attribute
        super()
      end

      # TODO: nil? -> is_nil?
      def is_nil?
        @val.nil?
      end

      def hash
        [self.class, val, attribute].hash
      end

      def eql?(other)
        if other.is_a?(Casted)
          self.class == other.class &&
              self.val == other.val &&
              self.attribute == other.attribute
        else
          false
        end
      end
      def ==(other)
        eql?(other)
      end
    end

    class Quoted < Arel::Nodes::Unary # :nodoc:
      def val
        value
      end
      # TODO: nil? -> is_nil?
      def is_nil?
        val.nil?
      end
    end

    def self.build_quoted(other, attribute = nil)
      case other
        when Arel::Nodes::Node, Arel::Attributes::Attribute, Arel::Table, Arel::Nodes::BindParam, Arel::SelectManager, Arel::Nodes::Quoted, Arel::Nodes::SqlLiteral
          other
        else
          case attribute
            when Arel::Attributes::Attribute
              Casted.new other, attribute
            else
              Quoted.new other
          end
      end
    end
  end
end
