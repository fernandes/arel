# # frozen_string_literal: true
# require "../spec_helper"
#
# describe Arel::Nodes::Bin do
#   it "new" do
#     Arel::Nodes::Bin.new("zomg").should eq(true)
#   end
#
#   it "default_to_sql" do
#     viz  = Arel::Visitors::ToSql.new Table.engine.connection_pool
#     node = Arel::Nodes::Bin.new(Arel.sql("zomg"))
#     viz.accept(node, Collectors::SQLString.new).value.should eq("zomg")
#   end
#
#   it "mysql_to_sql" do
#     viz  = Arel::Visitors::MySQL.new Table.engine.connection_pool
#     node = Arel::Nodes::Bin.new(Arel.sql("zomg"))
#     viz.accept(node, Collectors::SQLString.new).value.should eq("BINARY zomg")
#   end
#
#   it "equality_with_same_ivars" do
#     array = [Bin.new("zomg"), Bin.new("zomg")]
#     array.uniq.size.should eq(1)
#   end
#
#   it "inequality_with_different_ivars" do
#     array = [Bin.new("zomg"), Bin.new("zomg!")]
#     array.uniq.size.should eq(2)
#   end
# end
