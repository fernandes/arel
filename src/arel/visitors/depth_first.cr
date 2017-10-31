# frozen_string_literal: true
module Arel
  module Visitors
    class DepthFirst < Arel::Visitors::Visitor
      def initialize(block = nil)
        # TODO: was inferred to be Nil, but Nil alone provides no information
        # @block = block || -> {}
        super()
      end

      private def visit(o)
        super
        @block.call o
      end

      private def unary(o)
        visit o.expr
      end
      def visit_Arel_Nodes_Else(o)
        unary(o)
      end
      def visit_Arel_Nodes_Group(o)
        unary(o)
      end
      def visit_Arel_Nodes_Cube(o)
        unary(o)
      end
      def visit_Arel_Nodes_RollUp(o)
        unary(o)
      end
      def visit_Arel_Nodes_GroupingSet(o)
        unary(o)
      end
      def visit_Arel_Nodes_GroupingElement(o)
        unary(o)
      end
      def visit_Arel_Nodes_Grouping(o)
        unary(o)
      end
      def visit_Arel_Nodes_Having(o)
        unary(o)
      end
      def visit_Arel_Nodes_Limit(o)
        unary(o)
      end
      def visit_Arel_Nodes_Not(o)
        unary(o)
      end
      def visit_Arel_Nodes_Offset(o)
        unary(o)
      end
      def visit_Arel_Nodes_On(o)
        unary(o)
      end
      def visit_Arel_Nodes_Ordering(o)
        unary(o)
      end
      def visit_Arel_Nodes_Ascending(o)
        unary(o)
      end
      def visit_Arel_Nodes_Descending(o)
        unary(o)
      end
      def visit_Arel_Nodes_Top(o)
        unary(o)
      end
      def visit_Arel_Nodes_UnqualifiedColumn(o)
        unary(o)
      end

      private def function(o)
        visit o.expressions
        visit o.alias
        visit o.distinct
      end
      def visit_Arel_Nodes_Avg(o)
        function(o)
      end
      def visit_Arel_Nodes_Exists(o)
        function(o)
      end
      def visit_Arel_Nodes_Max(o)
        function(o)
      end
      def visit_Arel_Nodes_Min(o)
        function(o)
      end
      def visit_Arel_Nodes_Sum(o)
        function(o)
      end

      private def visit_Arel_Nodes_NamedFunction(o)
        visit o.name
        visit o.expressions
        visit o.distinct
        visit o.alias
      end

      private def visit_Arel_Nodes_Count(o)
        visit o.expressions
        visit o.alias
        visit o.distinct
      end

      private def visit_Arel_Nodes_Case(o)
        visit o.case
        visit o.conditions
        visit o.default
      end

      private def nary(o)
        o.children.each { |child| visit child}
      end
      def visit_Arel_Nodes_And(o)
        nary(o)
      end

      private def binary(o)
        visit o.left
        visit o.right
      end
      def visit_Arel_Nodes_As(o)
        binary(o)
      end
      def visit_Arel_Nodes_Assignment(o)
        binary(o)
      end
      def visit_Arel_Nodes_Between(o)
        binary(o)
      end
      def visit_Arel_Nodes_Concat(o)
        binary(o)
      end
      def visit_Arel_Nodes_DeleteStatement(o)
        binary(o)
      end
      def visit_Arel_Nodes_DoesNotMatch(o)
        binary(o)
      end
      def visit_Arel_Nodes_Equality(o)
        binary(o)
      end
      def visit_Arel_Nodes_FullOuterJoin(o)
        binary(o)
      end
      def visit_Arel_Nodes_GreaterThan(o)
        binary(o)
      end
      def visit_Arel_Nodes_GreaterThanOrEqual(o)
        binary(o)
      end
      def visit_Arel_Nodes_In(o)
        binary(o)
      end
      def visit_Arel_Nodes_InfixOperation(o)
        binary(o)
      end
      def visit_Arel_Nodes_JoinSource(o)
        binary(o)
      end
      def visit_Arel_Nodes_InnerJoin(o)
        binary(o)
      end
      def visit_Arel_Nodes_LessThan(o)
        binary(o)
      end
      def visit_Arel_Nodes_LessThanOrEqual(o)
        binary(o)
      end
      def visit_Arel_Nodes_Matches(o)
        binary(o)
      end
      def visit_Arel_Nodes_NotEqual(o)
        binary(o)
      end
      def visit_Arel_Nodes_NotIn(o)
        binary(o)
      end
      def visit_Arel_Nodes_NotRegexp(o)
        binary(o)
      end
      def visit_Arel_Nodes_Or(o)
        binary(o)
      end
      def visit_Arel_Nodes_OuterJoin(o)
        binary(o)
      end
      def visit_Arel_Nodes_Regexp(o)
        binary(o)
      end
      def visit_Arel_Nodes_RightOuterJoin(o)
        binary(o)
      end
      def visit_Arel_Nodes_TableAlias(o)
        binary(o)
      end
      def visit_Arel_Nodes_Values(o)
        binary(o)
      end
      def visit_Arel_Nodes_When(o)
        binary(o)
      end

      private def visit_Arel_Nodes_StringJoin(o)
        visit o.left
      end

      private def visit_Arel_Attribute(o)
        visit o.relation
        visit o.name
      end
      def visit_Arel_Attributes_Integer(o)
        visit_Arel_Attribute(o)
      end
      def visit_Arel_Attributes_Float(o)
        visit_Arel_Attribute(o)
      end
      def visit_Arel_Attributes_String(o)
        visit_Arel_Attribute(o)
      end
      def visit_Arel_Attributes_Time(o)
        visit_Arel_Attribute(o)
      end
      def visit_Arel_Attributes_Boolean(o)
        visit_Arel_Attribute(o)
      end
      def visit_Arel_Attributes_Attribute(o)
        visit_Arel_Attribute(o)
      end
      def visit_Arel_Attributes_Decimal(o)
        visit_Arel_Attribute(o)
      end

      private def visit_Arel_Table(o)
        visit o.name
      end

      private def terminal(o)
      end
      def visit_ActiveSupport_Multibyte_Chars(o)
        terminal(o)
      end
      def visit_ActiveSupport_StringInquirer(o)
        terminal(o)
      end
      def visit_Arel_Nodes_Lock(o)
        terminal(o)
      end
      def visit_Arel_Nodes_Node(o)
        terminal(o)
      end
      def visit_Arel_Nodes_SqlLiteral(o)
        terminal(o)
      end
      def visit_Arel_Nodes_BindParam(o)
        terminal(o)
      end
      def visit_Arel_Nodes_Window(o)
        terminal(o)
      end
      def visit_Arel_Nodes_True(o)
        terminal(o)
      end
      def visit_Arel_Nodes_False(o)
        terminal(o)
      end
      def visit_BigDecimal(o)
        terminal(o)
      end
      def visit_Bignum(o)
        terminal(o)
      end
      def visit_Class(o)
        terminal(o)
      end
      def visit_Date(o)
        terminal(o)
      end
      def visit_DateTime(o)
        terminal(o)
      end
      def visit_FalseClass(o)
        terminal(o)
      end
      def visit_Fixnum(o)
        terminal(o)
      end
      def visit_Float(o)
        terminal(o)
      end
      def visit_Integer(o)
        terminal(o)
      end
      def visit_NilClass(o)
        terminal(o)
      end
      def visit_String(o)
        terminal(o)
      end
      def visit_Symbol(o)
        terminal(o)
      end
      def visit_Time(o)
        terminal(o)
      end
      def visit_TrueClass(o)
        terminal(o)
      end

      private def visit_Arel_Nodes_InsertStatement(o)
        visit o.relation
        visit o.columns
        visit o.values
      end

      private def visit_Arel_Nodes_SelectCore(o)
        visit o.projections
        visit o.source
        visit o.wheres
        visit o.groups
        visit o.windows
        visit o.havings
      end

      private def visit_Arel_Nodes_SelectStatement(o)
        visit o.cores
        visit o.orders
        visit o.limit
        visit o.lock
        visit o.offset
      end

      private def visit_Arel_Nodes_UpdateStatement(o)
        visit o.relation
        visit o.values
        visit o.wheres
        visit o.orders
        visit o.limit
      end

      private def visit_Array(o)
        o.each { |i| visit i }
      end
      def visit_Set(o)
        visit_Array(o)
      end

      private def visit_Hash(o)
        o.each { |k,v| visit(k); visit(v) }
      end

      DISPATCH = dispatch_cache

      def get_dispatch_cache
        DISPATCH
      end
    end
  end
end
