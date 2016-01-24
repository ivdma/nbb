module Nbb
  module Models
    class Team < Nbb::Models::Base
      ATTRIBUTES = [:id, :comp_id, :naam, :club_id].freeze
      ATTRIBUTES.each { |attribute| attr_accessor attribute }

      def name
        naam
      end
    end
  end
end
