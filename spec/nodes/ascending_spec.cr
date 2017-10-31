# frozen_string_literal: true
require "../spec_helper"

describe Arel::Nodes do
  it "constructs" do
    ascending = Arel::Nodes::Ascending.new "zomg"
    "zomg".should eq(ascending.expr)
  end

  it "reverse" do
    ascending = Arel::Nodes::Ascending.new "zomg"
    descending = ascending.reverse
    typeof(descending).should eq(Arel::Nodes::Descending)
    ascending.expr.should eq(descending.expr)
  end

  it "direction" do
    ascending = Arel::Nodes::Ascending.new "zomg"
    :asc.should eq(ascending.direction)
  end

  it "ascending?" do
    ascending = Arel::Nodes::Ascending.new "zomg"
    ascending.ascending?.should be_true
  end

  it "descending?" do
    ascending = Arel::Nodes::Ascending.new "zomg"
    (!ascending.descending?).should be_true
  end

  it "equality_with_same_ivars" do
    array = [Arel::Nodes::Ascending.new("zomg"), Arel::Nodes::Ascending.new("zomg")]
    1.should eq(array.uniq.size)
  end

  it "inequality_with_different_ivars" do
    array = [Arel::Nodes::Ascending.new("zomg"), Arel::Nodes::Ascending.new("zomg!")]
    2.should eq(array.uniq.size)
  end
end
