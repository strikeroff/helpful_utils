module HelpfulUtils
  module CoreExt
    module Array
      def clone_by_someway(value)
        return value if value.is_a?(Symbol)
        if value.respond_to?(:deep_clone)
          value.deep_clone
        else
          value.clone
        end
      end
      
      def deep_clone
        self.collect{|v| clone_by_someway(v)}
      end
    end
  end
end

class Array
  include HelpfulUtils::CoreExt::Array
end