# frozen_string_literal: true
module Arel
  module Nodes
    class SelectStatement < Arel::Nodes::Node
      getter :cores
      property :limit, :orders, :lock, :offset, :with

      @limit : Int32 # TODO: check
      @lock : Bool # TODO: check
      @offset : Int32 # TODO: check
      @with : String # TODO: check

      def initialize(cores = [SelectCore.new])
        super()
        @cores          = cores
        @orders         = [] of String
        # TODO: was inferred to be Nil, but Nil alone provides no information
        @limit          = nil
        @lock           = nil
        @offset         = nil
        @with           = nil
      end

      def initialize_copy(other)
        super
        @cores  = @cores.map { |x| x.clone }
        @orders = @orders.map { |x| x.clone }
      end

      def hash
        [@cores, @orders, @limit, @lock, @offset, @with].hash
      end

      def eql?(other)
        if other.is_a?(SelectStatement)
          self.class == other.class &&
            self.cores == other.cores &&
            self.orders == other.orders &&
            self.limit == other.limit &&
            self.lock == other.lock &&
            self.offset == other.offset &&
            self.with == other.with
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
