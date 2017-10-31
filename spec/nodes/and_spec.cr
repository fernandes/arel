# frozen_string_literal: true
require "../spec_helper"

describe Arel::Nodes do
  describe "And" do
    describe "equality" do
      it "is equal with equal ivars" do
        array = [Arel::Nodes::And.new(["foo", "bar"] of Arel::Nodes::NodesArray), Arel::Nodes::And.new(["foo", "bar"] of Arel::Nodes::NodesArray)]
        1.should eq(array.uniq.size)
      end

      it "is not equal with different ivars" do
        array = [Arel::Nodes::And.new(["foo", "bar"] of Arel::Nodes::NodesArray ), Arel::Nodes::And.new(["foo", "baz"] of Arel::Nodes::NodesArray)]
        2.should eq(array.uniq.size)
      end
    end
  end
end
