# frozen_string_literal: true
require "./collectors/sql_string"

module Arel
  class TreeManager
    include Arel::FactoryMethods

    getter :ast

    def initialize
      # TODO: was inferred to be Nil, but Nil alone provides no information
      # @ctx = nil
    end

    def to_dot
      collector = Arel::Collectors::PlainString.new
      collector = Visitors::Dot.new.accept @ast, collector
      collector.value
    end

    def to_sql(engine = Table.engine)
      collector = Arel::Collectors::SQLString.new
      collector = engine.connection.visitor.accept @ast, collector
      collector.value
    end

    def initialize_copy(other)
      super
      @ast = @ast.clone
    end

    def where(expr)
      if Arel::TreeManager === expr
        expr = expr.ast
      end
      @ctx.wheres << expr
      self
    end
  end
end
