require "spec"
require "../src/arel"
require "./support/fake_record"
Arel::Table.engine = FakeRecord::Base.new
