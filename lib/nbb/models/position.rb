module Nbb
  module Models
    class Position < Nbb::Models::Base
      ACTIVE = 'Actief'.freeze
      WITHDRAWN = 'Teruggetrokken'.freeze

      ATTRIBUTES = [:afko, :ID, :status, :rang, :gespeeld, :percentage, :tegenscore, :punten, :eigenscore, :datum,
                    :team, :saldo, :positie].freeze
      attr_accessor(*ATTRIBUTES)

      alias_method :abbreviation, :afko
      alias_method :competition_id, :ID
      alias_method :rank, :rang
      alias_method :played, :gespeeld
      alias_method :points, :punten
      alias_method :date, :datum
      alias_method :balance, :saldo
      alias_method :position, :positie
    end
  end
end
