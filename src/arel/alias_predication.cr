# frozen_string_literal: true
module Arel
  module AliasPredication
    # Syntax error in src/alias_predication.cr:4: 'as' is a pseudo-method and can't be redefined
    def alias(other)
      Nodes::As.new self, Nodes::SqlLiteral.new(other)
    end
  end
end
