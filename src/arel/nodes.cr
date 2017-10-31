module Arel
  module Nodes
    alias NodesArray = (String | Int32 | Arel::Nodes::Node)
  end
end

# frozen_string_literal: true
# node
require "./nodes/node"
require "./nodes/select_statement"
require "./nodes/select_core"
require "./nodes/insert_statement"
require "./nodes/update_statement"
require "./nodes/bind_param"
#
# # terminal
#
require "./nodes/terminal"
require "./nodes/true"
require "./nodes/false"
#
# # unary
require "./nodes/unary"
require "./nodes/grouping"
require "./nodes/ascending"
require "./nodes/descending"
require "./nodes/unqualified_column"
require "./nodes/with"
#
# # binary
require "./nodes/binary"
require "./nodes/equality"
require "./nodes/in" # Why is this subclassed from equality?
require "./nodes/join_source"
require "./nodes/delete_statement"
require "./nodes/table_alias"
require "./nodes/infix_operation"
require "./nodes/unary_operation"
require "./nodes/over"
require "./nodes/matches"
require "./nodes/regexp"
#
# # nary
require "./nodes/and"
#
# # function
# # FIXME: Function + Alias can be rewritten as a Function and Alias node.
# # We should make Function a Unary node and deprecate the use of "aliaz"
require "./nodes/function"
require "./nodes/count"
require "./nodes/extract"
require "./nodes/values"
require "./nodes/values_list"
require "./nodes/named_function"
#
# # windows
require "./nodes/window"
#
# # conditional expressions
require "./nodes/case"
#
# # joins
require "./nodes/full_outer_join"
require "./nodes/inner_join"
require "./nodes/outer_join"
require "./nodes/right_outer_join"
require "./nodes/string_join"
#
require "./nodes/sql_literal"
#
require "./nodes/casted"
