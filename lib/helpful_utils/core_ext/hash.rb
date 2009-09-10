module HelpfulUtils
  module CoreExt
    module Hash
      def deep_clone
        hash = {}
        self.each_pair do |key, value|
          hash.merge!({clone_by_someway(key)=>clone_by_someway(value)})
        end
        hash
      end

      def clone_by_someway(value)
        return value if value.is_a?(Symbol)
        if value.respond_to?(:deep_clone)
          value.deep_clone
        else
          value.clone
        end
      end
    end

  end
end

class Hash
  include HelpfulUtils::CoreExt::Hash
end