# # frozen_string_literal: true
# require "../spec_helper"
# require "set"
#
# module Arel
#   module Nodes
#     describe "Binary" do
#       describe "#hash" do
#         it "generates a hash based on its value" do
#           eq = Arel::Nodes::Equality.new("foo", "bar")
#           eq2 = Arel::Nodes::Equality.new("foo", "bar")
#           eq3 = Arel::Nodes::Equality.new("bar", "baz")
#
#           assert_equal eq.hash, eq2.hash
#           refute_equal eq.hash, eq3.hash
#         end
#
#         it "generates a hash specific to its class" do
#           eq = Arel::Nodes::Equality.new("foo", "bar")
#           neq = Arel::Nodes::NotEqual.new("foo", "bar")
#
#           refute_equal eq.hash, neq.hash
#         end
#       end
#     end
#   end
# end
