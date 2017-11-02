# # frozen_string_literal: true
# require "../spec_helper"
#
# module Arel
#   module Nodes
#     describe "Case" do
#       describe "#initialize" do
#         it "sets case expression from first argument" do
#           node = Case.new "foo"
#
#           node.case.should eq("foo")
#         end
#
#         it "sets default case from second argument" do
#           node = Case.new nil, "bar"
#
#           node.default.should eq("bar")
#         end
#       end
#
#       describe "#clone" do
#         it "clones case, conditions and default" do
#           foo = Nodes.build_quoted "foo"
#
#           node = Case.new
#           node.case = foo
#           node.conditions = [When.new(foo, foo)]
#           node.default = foo
#
#           dolly = node.clone
#
#           node.case.should eq(dolly.case)
#           node.case.object_id.refute eq(dolly.case.object_id)
#
#           node.conditions.should eq(dolly.conditions)
#           node.conditions.object_id.refute eq(dolly.conditions.object_id)
#
#           node.default.should eq(dolly.default)
#           node.default.object_id.refute eq(dolly.default.object_id)
#         end
#       end
#
#       # describe "equality" do
#       #   it "is equal with equal ivars" do
#       #     foo = Nodes.build_quoted "foo"
#       #     one = Nodes.build_quoted 1
#       #     zero = Nodes.build_quoted 0
#       #
#       #     case1 = Case.new foo
#       #     case1.conditions = [When.new(foo, one)]
#       #     case1.default = Else.new zero
#       #
#       #     case2 = Case.new foo
#       #     case2.conditions = [When.new(foo, one)]
#       #     case2.default = Else.new zero
#       #
#       #     array = [case1, case2]
#       #
#       #     assert_equal 1, array.uniq.size
#       #   end
#       #
#       #   it "is not equal with different ivars" do
#       #     foo = Nodes.build_quoted "foo"
#       #     bar = Nodes.build_quoted "bar"
#       #     one = Nodes.build_quoted 1
#       #     zero = Nodes.build_quoted 0
#       #
#       #     case1 = Case.new foo
#       #     case1.conditions = [When.new(foo, one)]
#       #     case1.default = Else.new zero
#       #
#       #     case2 = Case.new foo
#       #     case2.conditions = [When.new(bar, one)]
#       #     case2.default = Else.new zero
#       #
#       #     array = [case1, case2]
#       #
#       #     assert_equal 2, array.uniq.size
#       #   end
#       # end
#     end
#   end
# end
