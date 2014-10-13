module Mongoid::Relations
  module ActiveRecordAdapter
    extend ActiveSupport::Concern

    def self.apply base, name, options = {}
      options[:name] = name
      metadata = options.with_indifferent_access
      metadata[:klass] = name.to_s.classify.constantize
      metadata[:inverse_name] = "boss"
      metadata[:foreign_key]  = "#{metadata[:inverse_name]}_id"

      define_accessors base, metadata
    end

    def self.define_accessors base, metadata
      accessors = Module.new
      accessors.send :define_method, metadata[:name] do
        metadata[:klass].where(metadata[:foreign_key] => self.id.to_s)
      end

      base.include accessors
    end

    module ClassMethods
      def has_many_documents name
        concern = Mongoid::Relations::ActiveRecordAdapter
        concern.apply self, name
      end
    end
  end
end
