module ActiveRecord::Associations
  module MongoidAdapter
    extend ActiveSupport::Concern

    def self.apply base, name, options = {}
      options[:name] = name
      metadata = options.with_indifferent_access
      metadata[:klass] = name.to_s.classify.constantize
      metadata[:id_getter] = "#{name}_id"
      metadata[:id_setter] = "#{name}_id="

      define_accessors base, metadata
      define_mutators  base, metadata
    end

    def self.define_accessors base, metadata
      accessors = Module.new
      accessors.send :define_method, metadata[:name] do
        (foreign_key = self.send metadata[:id_getter]).blank? ?
          nil :
          metadata[:klass].find(foreign_key)
      end

      base.include accessors
    end

    def self.define_mutators base, metadata
      mutators = Module.new
      mutators.send :define_method, "#{metadata[:name]}=" do |value|
        self.send metadata[:id_setter], value.try(:id).try(:to_s)
      end

      base.include mutators
    end

    module ClassMethods
      def belongs_to_document name
        concern = ActiveRecord::Associations::MongoidAdapter
        concern.apply self, name
      end
    end
  end
end
