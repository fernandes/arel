# frozen_string_literal: true
module Arel
  module Visitors
    class Visitor
      @dispatch : DynamicHash

      def initialize
        @dispatch = get_dispatch_cache
      end

      def accept(object)
        visit object
      end

      def self.dispatch_cache
        DynamicHash.new
      end

      private def get_dispatch_cache
        self.class.dispatch_cache
      end

      private def dispatch
        @dispatch
      end

      private def visit(object)
        dispatch_method = dispatch[object.class]
        send dispatch_method, object
      rescue e : NoMethodError
        raise e if respond_to?(dispatch_method, true)
        superklass = object.class.ancestors.find { |klass|
          respond_to?(dispatch[klass], true)
        }
        raise(TypeError, "Cannot visit #{object.class}") unless superklass
        dispatch[object.class] = dispatch[superklass]
        retry
      end
    end

    class DynamicHash
      @hash = {} of String => String

      def initialize
      end

      def [](value)
      end
    end
  end
end
