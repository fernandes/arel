require "../expressions"
require "../predications"
require "../alias_predication"
require "../order_predications"
require "../math"

module Arel
  module Attributes
    class Attribute
      include Arel::Expressions
      include Arel::Predications
      include Arel::AliasPredication
      include Arel::OrderPredications
      include Arel::Math

      property :relation, :name

      def initialize(@relation : Arel::Table, @name : Symbol)
      end
      def_clone

      def name
        self.class.name
      end

      ###
      # Create a node for lowering this attribute
      def lower
        relation.lower self
      end

      def type_cast_for_database(value)
        relation.type_cast_for_database(name, value)
      end

      def able_to_type_cast?
        relation.able_to_type_cast?
      end
    end

    class String    < Attribute; end
    class Time      < Attribute; end
    class Boolean   < Attribute; end
    class Decimal   < Attribute; end
    class Float     < Attribute; end
    class Integer   < Attribute; end
    class Undefined < Attribute; end
  end

  Attribute = Attributes::Attribute
end
