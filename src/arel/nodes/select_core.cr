# frozen_string_literal: true
module Arel
  module Nodes
    class SelectCore < Arel::Nodes::Node
      property :top, :projections, :wheres, :groups, :windows
      property :havings, :source, :set_quantifier
      @top : String # TODO: check
      @set_quantifier : String # TODO: check

      def initialize
        super()
        @source         = JoinSource.new nil
        @top            = nil

        # http://savage.net.au/SQL/sql-92.bnf.html#set%20quantifier
        @set_quantifier = nil
        @projections    = [] of String
        @wheres         = [] of String
        @groups         = [] of String
        @havings        = [] of String
        @windows        = [] of String
      end

      def from
        @source.left
      end

      def from=(value)
        @source.left = value
      end

      def froms=(value)
        from=(value)
      end

      def froms
        from
      end

      def initialize_copy(other)
        super
        @source      = @source.clone if @source
        @projections = @projections.clone
        @wheres      = @wheres.clone
        @groups      = @groups.clone
        @havings     = @havings.clone
        @windows     = @windows.clone
      end

      def hash
        [
          @source, @top, @set_quantifier, @projections,
          @wheres, @groups, @havings, @windows
        ].hash
      end

      def eql?(other)
        if other.is_a?(SelectCore)
          self.class == other.class &&
            self.source == other.source &&
            self.top == other.top &&
            self.set_quantifier == other.set_quantifier &&
            self.projections == other.projections &&
            self.wheres == other.wheres &&
            self.groups == other.groups &&
            self.havings == other.havings &&
            self.windows == other.windows
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
