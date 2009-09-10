require File.join(File.dirname(__FILE__), "helpful_utils", "common", "configuration")


Dir[File.join(File.dirname(__FILE__), "helpful_utils", "patching_utils")<<"/*.rb"].each do |file|
  require file
end

# Some files need to be required after iitialize
Rails::Initializer.class_eval do
  def after_initialize_with_helpful_utils
    HelpfulUtils::EventMachine.after_initialize_with_helpful_utils
    after_initialize_without_helpful_utils
  end
  alias_method_chain :after_initialize, :helpful_utils
end

HelpfulUtils::EventMachine.subscribe :after_initialize_with_helpful_utils do

  Dir[File.join(File.dirname(__FILE__), "helpful_utils", "core_ext")<<"/*.rb"].each do |file|  
    require file
  end

  require File.join(File.dirname(__FILE__), "helpful_utils", "activerecord_ext", "humanized_attributes.rb")


end