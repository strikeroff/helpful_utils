module HelpfulUtils
  # Класс служит для подписывания на события и выполнения кода по выполнении этих событий.
  # Пример с подписыванием на событие  after_initialize  htkmcjd
  # Rails::Initializer.class_eval do
  #  def after_initialize_with_helpful_utils
  #    HelpfulUtils::EventMachine.after_initialize_with_helpful_utils
  #    after_initialize_without_helpful_utils
  #  end
  #
  #    alias_method_chain :after_initialize, :helpful_utils
  #  end
  #
  #  HelpfulUtils::EventMachine.subscribe :after_initialize_with_helpful_utils do
  #    require File.join(File.dirname(__FILE__), "helpful_utils", "activerecord_ext", "humanized_attributes.rb")
  #  end
  # Feel free in use this tool,it's  powerfull =)



  class EventMachine
    @@actions_and_blocks = {}
#        cattr_accessor :actions_and_blocks
    class << self
      def method_missing(method_symbol, *parameters)#:nodoc:
        if @@actions_and_blocks.has_key? method_symbol
          @@actions_and_blocks[method_symbol].each do |action|
            action.call *parameters
          end
        end
      end

      def subscribe(event_symbol, &block)
        @@actions_and_blocks[event_symbol] ||= []
        @@actions_and_blocks[event_symbol] << block
      end
    end
  end
end