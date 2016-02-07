require 'spec_helper'

describe Nbb::Models::Club do
  it 'is Nbb::Models::Club' do
    expect(described_class.new(id: '0')).to be_a Nbb::Models::Club
  end

  describe 'initialization' do
    subject { Fabricate :club }

    context 'valid' do
      it 'parses id' do
        expect(subject.id).to eq 123
      end

      it 'parses org_id' do
        expect(subject.org_id).to eq 'iss_123'
      end

      it 'parses nr' do
        expect(subject.nr).to eq 23
      end

      it 'parses naam' do
        expect(subject.naam).to eq 'LA Lakers'
      end

      it 'parses shirt' do
        expect(subject.shirt).to eq 'geel'
      end

      it 'parses adres' do
        expect(subject.adres).to eq 'Mainstreet 1 Los Angeles'
      end

      it 'parses postcode' do
        expect(subject.postcode).to eq '123xyz'
      end

      it 'parses plaats' do
        expect(subject.plaats).to eq 'Los Angeles'
      end

      it 'parses web' do
        expect(subject.web).to eq 'http://nba.com/lalakers'
      end

      it 'parses vestpl' do
        expect(subject.vestpl).to eq 'Los Angeles'
      end
    end

    context 'invalid' do
      it 'does not assign methods that are not defined in ATTRIBUTES' do
        expect(described_class.new(foo: :bar)).to_not respond_to :foo
      end
    end
  end

  describe '#contact_address' do
    it 'makes a contact address string' do
      club = Fabricate :club, adres: 'Foo', postcode: 'Bar', plaats: 'Baz'
      expect(club.contact_address).to eq 'Foo Bar, Baz'
    end
  end

  describe 'aliasses' do
    subject { Fabricate :club }

    it 'aliases naam to name' do
      expect(subject.name).to eq subject.naam
    end

    it 'aliases org_id to organization_id' do
      expect(subject.organization_id).to eq subject.org_id
    end

    it 'aliases adres to address' do
      expect(subject.address).to eq subject.adres
    end

    it 'aliases postcode to zipcode' do
      expect(subject.zipcode).to eq subject.postcode
    end
  end
end
