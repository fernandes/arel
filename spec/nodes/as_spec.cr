# frozen_string_literal: true
require "../spec_helper"

module Arel
  module Nodes
    describe "As" do
      describe "#as" do
        it "makes an AS node" do
          table = Table.new(:users)[:id]
          table_as = table.node_as(Arel.sql("foo"))
          table_as.left.should eq(table)
          table_as.right.should eq("foo")
        end

        it "converts right to SqlLiteral if a string" do
          table = Table.new(:users)[:id]
          table_as = table.node_as("foo")
          table_as.right.should be_a(Arel::Nodes::SqlLiteral)
        end
      end

      describe "equality" do
        it "is equal with equal ivars" do
          array = [As.new("foo", "bar"), As.new("foo", "bar")]
          array.uniq.size.should eq(1)
        end

        it "is not equal with different ivars" do
          array = [As.new("foo", "bar"), As.new("foo", "baz")]
          array.uniq.size.should eq(2)
        end
      end
    end
  end
end
