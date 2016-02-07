module Nbb
  module Models
    class Competition < Nbb::Models::Base
      ATTRIBUTES = [:id, :org_id, :gewijzigd, :naam, :nr].freeze
      attr_accessor(*ATTRIBUTES)

      alias_method :name, :naam
      alias_method :organization_id, :org_id
      alias_method :updated_at, :gewijzigd
      alias_method :iss_id, :nr
    end
  end
end
