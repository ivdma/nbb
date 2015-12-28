module Models
  class Club < Models::Base
    ATTRIBUTES = %i(id org_id nr naam shirt adres postcode plaats web vestpl)

    ATTRIBUTES.each { |attribute| attr_accessor attribute }

    def initialize(club = {})
      club = club.with_indifferent_access
      club.each do |key, value|
        self.send("#{key}=", value) if ATTRIBUTES.include? key.to_sym
      end
    end

    def contact_address
      "#{adres} #{postcode}, #{plaats}"
    end

    def name
      naam
    end

    def organization_id
      org_id
    end

    def address
      adres
    end

    def zipcode
      postcode
    end
  end
end
