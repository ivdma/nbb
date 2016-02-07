module Nbb
  module Models
    class Base
      def initialize(attributes = {})
        attributes = attributes.with_indifferent_access
        attributes.each do |key, value|
          send("#{key}=", value) if default_attributes.include?(key.to_sym)
        end
      end

      def default_attributes
        self.class::ATTRIBUTES
      end
    end
  end
end
