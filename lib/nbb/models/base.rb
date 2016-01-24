module Nbb
  module Models
    class Base
      def initialize(attributes = {})
        attributes = attributes.with_indifferent_access
        attributes.each do |key, value|
          send("#{key}=", value) if self.class::ATTRIBUTES.include?(key.to_sym)
        end
      end
    end
  end
end
