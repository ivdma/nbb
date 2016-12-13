require 'spec_helper'

describe Nbb::Models::Location do
  it 'is Nbb::Models::Location' do
    expect(described_class.new).to be_a Nbb::Models::Location
  end

  describe 'initialization' do
    subject { Fabricate :location }

    context 'valid' do
      it 'parses adres' do
        expect(subject.adres).to eq 'Radiumstraat 150'
      end

      it 'parses plaats' do
        expect(subject.plaats).to eq 'Groningen'
      end

      it 'parses org_id' do
        expect(subject.org_id).to eq 5
      end

      it 'parses telefoon' do
        expect(subject.telefoon).to eq '050-5713650'
      end

      it 'parses id' do
        expect(subject.id).to eq 768
      end

      it 'parses lat' do
        expect(subject.lat).to eq '53.2247335'
      end

      it 'parses lon' do
        expect(subject.lon).to eq '6.5348694'
      end

      it 'parses naam' do
        expect(subject.naam).to eq 'Vinkhuizen'
      end

      it 'parses postcode' do
        expect(subject.postcode).to eq '9743 SV'
      end

      it 'parses nr' do
        expect(subject.nr).to eq 'GRNVI'
      end
    end

    context 'invalid' do
      it 'does not assign methods that are not defined in ATTRIBUTES' do
        expect(described_class.new(foo: :bar)).to_not respond_to :foo
      end
    end
  end

  describe 'aliasses' do
    subject { Fabricate :location }

    it 'has an alias for adres' do
      expect(subject.address).to eq subject.adres
    end

    it 'has an alias for plaats' do
      expect(subject.place).to eq subject.plaats
    end

    it 'has an alias for org_id' do
      expect(subject.organization_id).to eq subject.org_id
    end

    it 'has an alias for telefoon' do
      expect(subject.phone).to eq subject.telefoon
    end

    it 'has an alias for lat' do
      expect(subject.lat).to eq subject.lat
    end

    it 'has an alias for lon' do
      expect(subject.lng).to eq subject.lon
    end

    it 'has an alias for naam' do
      expect(subject.name).to eq subject.naam
    end

    it 'has an alias for postcode' do
      expect(subject.zip).to eq subject.postcode
    end

    it 'has an alias for nr' do
      expect(subject.iss_id).to eq subject.nr
    end
  end
end
