module Nbb
  module Models
    class Team < Nbb::Models::Base
      ATTRIBUTES = [:id, :comp_id, :naam, :club_id]

      ATTRIBUTES.each { |attribute| attr_accessor attribute }

      def initialize(club = {})
        club = club.with_indifferent_access
        club.each do |key, value|
          self.send("#{key}=", value) if ATTRIBUTES.include? key.to_sym
        end
      end

      def name
        naam
      end
    end
  end
end
