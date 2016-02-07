module Nbb
  module Models
    class Match < Nbb::Models::Base
      ATTRIBUTES = [:id, :loc_id, :cmp_id, :org_id,
                    :thuis_club_id, :thuis_ploeg_id, :score_thuis, :thuis_ploeg,
                    :uit_club_id, :uit_ploeg_id, :score_uit, :uit_ploeg,
                    :cmp_nr, :nr, :stats, :datum].freeze
      attr_accessor(*ATTRIBUTES)

      alias_method :location_id,        :loc_id
      alias_method :competition_id,     :cmp_id
      alias_method :organization_id,    :org_id
      alias_method :competition_number, :cmp_nr
      alias_method :number,             :nr
      alias_method :date,               :datum
      alias_method :home_club_id,       :thuis_club_id
      alias_method :away_club_id,       :uit_club_id
      alias_method :home_team_id,       :thuis_ploeg_id
      alias_method :away_team_id,       :uit_ploeg_id
      alias_method :home_team,          :thuis_ploeg
      alias_method :away_team,          :uit_ploeg
      alias_method :home_score,         :score_thuis
      alias_method :away_score,         :score_uit
    end
  end
end
