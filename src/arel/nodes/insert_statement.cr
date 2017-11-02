# frozen_string_literal: true
module Arel
  module Nodes
    class InsertStatement < Arel::Nodes::Node
      property :relation, :columns, :values, :select

      @relation : String # TODO: check
      @values : String # TODO: check
      @select : String # TODO: check

      def initialize
        super()
        @relation = nil
        @columns  = [] of String
        @values   = nil
        @select   = nil
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
        if other.is_a?(InsertStatement)
          self.class == other.class &&
            self.relation == other.relation &&
            self.columns == other.columns &&
            self.select == other.select &&
            self.values == other.values
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
