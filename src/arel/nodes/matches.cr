# frozen_string_literal: true
module Arel
  module Nodes
    class Matches < Binary
      getter :escape
      property :case_sensitive

      def initialize(left, right, escape = nil, case_sensitive = false)
        super(left, right)
        # TODO: was inferred to be Nil, but Nil alone provides no information
        # @escape = escape && Nodes.build_quoted(escape)
        @case_sensitive = case_sensitive
      end
    end

    class DoesNotMatch < Matches
    end
  end
end
