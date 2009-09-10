module HelpfulUtils
  module InheritanceTree
    def objects
      class_objects = []
      ObjectSpace.each_object(self) {|e| class_objects << e }
      class_objects
    end

    def class_children
      (@class_objects ||= Class.objects).select {|e| e.superclass == self }
    end
  end
end
Module.send :include, HelpfulUtils::InheritanceTree
