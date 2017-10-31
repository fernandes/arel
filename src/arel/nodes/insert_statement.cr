# frozen_string_literal: true
module Arel
  module Nodes
    class InsertStatement < Arel::Nodes::Node
      property :relation, :columns, :values, :select

      def initialize
        super()
        # @relation = nil
        @columns  = [] of String
        # @values   = nil
        # @select   = nil
      end

      def initialize_copy(other)
        super
        @columns = @columns.clone
        @values =  @values.clone if @values
        @select =  @select.clone if @select
      end

      def hash
        [@relation, @columns, @values, @select].hash
      end

      def eql?(other)
        self.class == other.class &&
          self.relation == other.relation &&
          self.columns == other.columns &&
          self.select == other.select &&
          self.values == other.values
      end
      def ==(other)
        eql?(other)
      end
    end
  end
end
