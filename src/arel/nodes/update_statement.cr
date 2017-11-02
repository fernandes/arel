# frozen_string_literal: true
module Arel
  module Nodes
    class UpdateStatement < Arel::Nodes::Node
      property :relation, :wheres, :values, :orders, :limit
      property :key

      @relation : String # TODO: check
      @limit : Int32 # TODO: check
      @key : String # TODO: check
      @relation : String # TODO: check

      def initialize
        @relation = nil
        @wheres   = [] of String
        @values   = [] of String
        @orders   = [] of String
        @limit    = nil
        @key      = nil
      end

      def initialize_copy(other)
        super
        @wheres = @wheres.clone
        @values = @values.clone
      end

      def hash
        [@relation, @wheres, @values, @orders, @limit, @key].hash
      end

      def eql?(other)
        if other.is_a?(UpdateStatement)
          self.class == other.class &&
            self.relation == other.relation &&
            self.wheres == other.wheres &&
            self.values == other.values &&
            self.orders == other.orders &&
            self.limit == other.limit &&
            self.key == other.key
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
