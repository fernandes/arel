# frozen_string_literal: true
require "../spec_helper"

module Arel
  module Nodes
    describe Casted do
      describe "#hash" do
        it "is equal when eql? returns true" do
          one = Casted.new 1, 2
          also_one = Casted.new 1, 2

          one.hash.should eq(also_one.hash)
        end
      end
    end
  end
end
