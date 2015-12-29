require 'spec_helper'

describe Nbb::Models::Club do
  let(:valid_attributes) do
    {
      id: '123',
      org_id: 'iss_123',
      nr: '23',
      naam: 'LA Lakers',
      shirt: 'geel',
      adres: 'Mainstreet 1, Los Angeles',
      postcode: '123xyz',
      plaats: 'Los Angeles',
      web: 'http://nba.com/lalakers',
      vestpl: 'Los Angeles'
    }
  end

  it 'is Nbb::Models::Club' do
    expect(described_class.new(id: '0')).to be_a Nbb::Models::Club
  end

  describe 'initialization' do
    subject { described_class.new(valid_attributes) }

    context 'valid' do
      it 'parses id' do
        expect(subject.id).to eq valid_attributes[:id]
      end

      it 'parses org_id' do
        expect(subject.org_id).to eq valid_attributes[:org_id]
      end

      it 'parses nr' do
        expect(subject.nr).to eq valid_attributes[:nr]
      end

      it 'parses naam' do
        expect(subject.naam).to eq valid_attributes[:naam]
      end

      it 'parses shirt' do
        expect(subject.shirt).to eq valid_attributes[:shirt]
      end

      it 'parses adres' do
        expect(subject.adres).to eq valid_attributes[:adres]
      end

      it 'parses postcode' do
        expect(subject.postcode).to eq valid_attributes[:postcode]
      end

      it 'parses plaats' do
        expect(subject.plaats).to eq valid_attributes[:plaats]
      end

      it 'parses web' do
        expect(subject.web).to eq valid_attributes[:web]
      end

      it 'parses vestpl' do
        expect(subject.vestpl).to eq valid_attributes[:vestpl]
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
      expected = "#{valid_attributes[:adres]} #{valid_attributes[:postcode]}, #{valid_attributes[:plaats]}"
      expect(described_class.new(valid_attributes).contact_address).to eq expected
    end
  end

  describe 'aliasses' do
    subject { described_class.new(valid_attributes) }

    it 'aliases naam to name' do
      expect(subject.name).to eq valid_attributes[:naam]
    end

    it 'aliases org_id to organization_id' do
      expect(subject.organization_id).to eq valid_attributes[:org_id]
    end

    it 'aliases adres to address' do
      expect(subject.address).to eq valid_attributes[:adres]
    end

    it 'aliases postcode to zipcode' do
      expect(subject.zipcode).to eq valid_attributes[:postcode]
    end
  end
end
