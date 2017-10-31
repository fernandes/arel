# frozen_string_literal: true
module Arel
  module Visitors
    class Dot < Arel::Visitors::Visitor
      class Node # :nodoc:
        property :name, :id, :fields

        def initialize(name, id, fields = ([] of String))
          @name   = name
          @id     = id
          @fields = fields
        end
      end

      class Edge # :nodoc:
        property :name, :from, :to
      end

      def initialize
        super()
        @nodes      = [] of String
        @edges      = [] of String
        @node_stack = [] of String
        @edge_stack = [] of String
        @seen       = {} of String => String
      end

      def accept(object, collector)
        visit object
        collector << to_dot
      end



      private def visit_Arel_Nodes_Ordering(o)
        visit_edge o, "expr"
      end

      private def visit_Arel_Nodes_TableAlias(o)
        visit_edge o, "name"
        visit_edge o, "relation"
      end

      private def visit_Arel_Nodes_Count(o)
        visit_edge o, "expressions"
        visit_edge o, "distinct"
      end

      private def visit_Arel_Nodes_Values(o)
        visit_edge o, "expressions"
      end

      private def visit_Arel_Nodes_StringJoin(o)
        visit_edge o, "left"
      end

      private def visit_Arel_Nodes_InnerJoin(o)
        visit_edge o, "left"
        visit_edge o, "right"
      end
      private def visit_Arel_Nodes_FullOuterJoin(o)
        visit_Arel_Nodes_InnerJoin(o)
      end
      private def visit_Arel_Nodes_OuterJoin(o)
        visit_Arel_Nodes_InnerJoin(o)
      end
      private def visit_Arel_Nodes_RightOuterJoin(o)
        visit_Arel_Nodes_InnerJoin(o)
      end

      private def visit_Arel_Nodes_DeleteStatement(o)
        visit_edge o, "relation"
        visit_edge o, "wheres"
      end

      private def unary(o)
        visit_edge o, "expr"
      end
      private def visit_Arel_Nodes_Group(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Cube(o)
        unary(o)
      end
      private def visit_Arel_Nodes_RollUp(o)
        unary(o)
      end
      private def visit_Arel_Nodes_GroupingSet(o)
        unary(o)
      end
      private def visit_Arel_Nodes_GroupingElement(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Grouping(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Having(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Limit(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Not(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Offset(o)
        unary(o)
      end
      private def visit_Arel_Nodes_On(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Top(o)
        unary(o)
      end
      private def visit_Arel_Nodes_UnqualifiedColumn(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Preceding(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Following(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Rows(o)
        unary(o)
      end
      private def visit_Arel_Nodes_Range(o)
        unary(o)
      end

      private def window(o)
        visit_edge o, "partitions"
        visit_edge o, "orders"
        visit_edge o, "framing"
      end
      private def visit_Arel_Nodes_Window(o)
        window(o)
      end

      private def named_window(o)
        visit_edge o, "partitions"
        visit_edge o, "orders"
        visit_edge o, "framing"
        visit_edge o, "name"
      end
      private def visit_Arel_Nodes_NamedWindow(o)
        named_window(o)
      end

      private def function(o)
        visit_edge o, "expressions"
        visit_edge o, "distinct"
        visit_edge o, "alias"
      end
      private def visit_Arel_Nodes_Exists(o)
        function(o)
      end
      private def visit_Arel_Nodes_Min(o)
        function(o)
      end
      private def visit_Arel_Nodes_Max(o)
        function(o)
      end
      private def visit_Arel_Nodes_Avg(o)
        function(o)
      end
      private def visit_Arel_Nodes_Sum(o)
        function(o)
      end

      private def extract(o)
        visit_edge o, "expressions"
        visit_edge o, "alias"
      end
      private def visit_Arel_Nodes_Extract(o)
        extract(o)
      end

      private def visit_Arel_Nodes_NamedFunction(o)
        visit_edge o, "name"
        visit_edge o, "expressions"
        visit_edge o, "distinct"
        visit_edge o, "alias"
      end

      private def visit_Arel_Nodes_InsertStatement(o)
        visit_edge o, "relation"
        visit_edge o, "columns"
        visit_edge o, "values"
      end

      private def visit_Arel_Nodes_SelectCore(o)
        visit_edge o, "source"
        visit_edge o, "projections"
        visit_edge o, "wheres"
        visit_edge o,  "windows"
      end

      private def visit_Arel_Nodes_SelectStatement(o)
        visit_edge o, "cores"
        visit_edge o, "limit"
        visit_edge o, "orders"
        visit_edge o, "offset"
      end

      private def visit_Arel_Nodes_UpdateStatement(o)
        visit_edge o, "relation"
        visit_edge o, "wheres"
        visit_edge o, "values"
      end

      private def visit_Arel_Table(o)
        visit_edge o, "name"
      end

      private def visit_Arel_Nodes_Casted(o)
        visit_edge o, "val"
        visit_edge o, "attribute"
      end

      private def visit_Arel_Attribute(o)
        visit_edge o, "relation"
        visit_edge o, "name"
      end
      private def visit_Arel_Attributes_Integer(o)
        visit_Arel_Attribute(o)
      end
      private def visit_Arel_Attributes_Float(o)
        visit_Arel_Attribute(o)
      end
      private def visit_Arel_Attributes_String(o)
        visit_Arel_Attribute(o)
      end
      private def visit_Arel_Attributes_Time(o)
        visit_Arel_Attribute(o)
      end
      private def visit_Arel_Attributes_Boolean(o)
        visit_Arel_Attribute(o)
      end
      private def visit_Arel_Attributes_Attribute(o)
        visit_Arel_Attribute(o)
      end

      private def nary(o)
        o.children.each_with_index do |x,i|
          edge(i) { visit x }
        end
      end
      private def visit_Arel_Nodes_And(o)
        nary(o)
      end

      private def binary(o)
        visit_edge o, "left"
        visit_edge o, "right"
      end
      private def visit_Arel_Nodes_As(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Assignment(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Between(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Concat(o)
        binary(o)
      end
      private def visit_Arel_Nodes_DoesNotMatch(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Equality(o)
        binary(o)
      end
      private def visit_Arel_Nodes_GreaterThan(o)
        binary(o)
      end
      private def visit_Arel_Nodes_GreaterThanOrEqual(o)
        binary(o)
      end
      private def visit_Arel_Nodes_In(o)
        binary(o)
      end
      private def visit_Arel_Nodes_JoinSource(o)
        binary(o)
      end
      private def visit_Arel_Nodes_LessThan(o)
        binary(o)
      end
      private def visit_Arel_Nodes_LessThanOrEqual(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Matches(o)
        binary(o)
      end
      private def visit_Arel_Nodes_NotEqual(o)
        binary(o)
      end
      private def visit_Arel_Nodes_NotIn(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Or(o)
        binary(o)
      end
      private def visit_Arel_Nodes_Over(o)
        binary(o)
      end

      private def visit_String(o)
        @node_stack.last.fields << o
      end
      private def visit_Time(o)
        visit_String(o)
      end
      private def visit_Date(o)
        visit_String(o)
      end
      private def visit_DateTime(o)
        visit_String(o)
      end
      private def visit_NilClass(o)
        visit_String(o)
      end
      private def visit_TrueClass(o)
        visit_String(o)
      end
      private def visit_FalseClass(o)
        visit_String(o)
      end
      private def visit_Integer(o)
        visit_String(o)
      end
      private def visit_Fixnum(o)
        visit_String(o)
      end
      private def visit_BigDecimal(o)
        visit_String(o)
      end
      private def visit_Float(o)
        visit_String(o)
      end
      private def visit_Symbol(o)
        visit_String(o)
      end
      private def visit_Arel_Nodes_SqlLiteral(o)
        visit_String(o)
      end

      private def visit_Arel_Nodes_BindParam(o)
      end

      private def visit_Hash(o)
        o.each_with_index do |pair, i|
          edge("pair_#{i}")   { visit pair }
        end
      end

      private def visit_Array(o)
        o.each_with_index do |x,i|
          edge(i) { visit x }
        end
      end
      private def visit_Set(o)
        visit_Array(o)
      end

      private def visit_edge(o, method)
        edge(method) { visit o.send(method) }
      end

      private def visit(o)
        if node = @seen[o.object_id]
          @edge_stack.last.to = node
          return
        end

        node = Node.new(o.class.name, o.object_id)
        @seen[node.id] = node
        @nodes << node
        with_node node do
          super
        end
      end

      private def edge(name)
        edge = Edge.new(name, @node_stack.last)
        @edge_stack.push edge
        @edges << edge
        yield
        @edge_stack.pop
      end

      private def with_node(node)
        if edge = @edge_stack.last
          edge.to = node
        end

        @node_stack.push(node)
        yield
        @node_stack.pop
      end

      private def quote(string)
        string.to_s.gsub("\"", "\\\"")
      end

      private def to_dot
        "digraph \"Arel\" {\nnode [width=0.375,height=0.25,shape=record];\n" +
          @nodes.map { |node|
            label = "<f0>#{node.name}"

            node.fields.each_with_index do |field, i|
              label += "|<f#{i + 1}>#{quote field}"
            end

            "#{node.id} [label=\"#{label}\"];"
          }.join("\n") + "\n" + @edges.map { |edge|
            "#{edge.from.id} -> #{edge.to.id} [label=\"#{edge.name}\"];"
          }.join("\n") + "\n}"
      end
    end
  end
end
