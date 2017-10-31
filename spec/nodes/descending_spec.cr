# frozen_string_literal: true
require "../spec_helper"

describe Arel::Nodes do
  it "construct" do
    descending = Arel::Nodes::Descending.new "zomg"
    "zomg".should eq(descending.expr)
  end

  it "reverse" do
    descending = Arel::Nodes::Descending.new "zomg"
    ascending = descending.reverse
    typeof(ascending).should eq(Arel::Nodes::Ascending)
    descending.expr.should eq(ascending.expr)
  end

  it "direction" do
    descending = Arel::Nodes::Descending.new "zomg"
    :desc.should eq(descending.direction)
  end

  it "ascending?" do
    descending = Arel::Nodes::Descending.new "zomg"
    (!descending.ascending?).should be_true
  end

  it "descending?" do
    descending = Arel::Nodes::Descending.new "zomg"
    (descending.descending?).should be_true
  end

  it "equality_with_same_ivars" do
    array = [Arel::Nodes::Descending.new("zomg"), Arel::Nodes::Descending.new("zomg")]
    1.should eq(array.uniq.size)
  end

  it "inequality_with_different_ivars" do
    array = [Arel::Nodes::Descending.new("zomg"), Arel::Nodes::Descending.new("zomg!")]
    2.should eq(array.uniq.size)
  end
end
