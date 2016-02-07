module Nbb
  module Models
    class Team < Nbb::Models::Base
      ATTRIBUTES = [:id, :comp_id, :naam, :club_id].freeze
      attr_accessor(*ATTRIBUTES)

      alias_method :competition_id, :comp_id
      alias_method :name, :naam
    end
  end
end
