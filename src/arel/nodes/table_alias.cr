# frozen_string_literal: true
module Arel
  module Nodes
    class TableAlias < Arel::Nodes::Binary
      def name
        right
      end

      def relation
        left
      end

      def table_alias
        name
      end

      def [](name)
        Attribute.new(self, name)
      end

      def table_name
        relation.respond_to?(:name) ? relation.name : name
      end

      def type_cast_for_database(*args)
        relation.type_cast_for_database(*args)
      end

      def able_to_type_cast?
        relation.respond_to?(:able_to_type_cast?) && relation.able_to_type_cast?
      end
    end
  end
end
