require 'spec_helper'

describe Nbb::Models::Competition do
  let(:valid_attributes) do
    {
      id: '123',
      org_id: '5',
      gewijzigd: '2015-12-20 18:34:30',
      naam: 'Nrd Mannen Senioren 3B',
      nr: 'NMS-3B'
    }
  end

  it 'is Nbb::Models::Competition' do
    expect(described_class.new).to be_a Nbb::Models::Competition
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

      it 'parses gewijzigd' do
        expect(subject.gewijzigd).to eq valid_attributes[:gewijzigd]
      end

      it 'parses naam' do
        expect(subject.naam).to eq valid_attributes[:naam]
      end

      it 'parses nr' do
        expect(subject.nr).to eq valid_attributes[:nr]
      end
    end

    context 'invalid' do
      it 'does not assign methods that are not defined in ATTRIBUTES' do
        expect(described_class.new(foo: :bar)).to_not respond_to :foo
      end
    end
  end

  describe 'aliasses' do
    subject { described_class.new(valid_attributes) }

    it 'has an alias name for naam' do
      expect(subject.name).to eq valid_attributes[:naam]
    end

    it 'has an alias organization_id for org_id' do
      expect(subject.organization_id).to eq valid_attributes[:org_id]
    end

    it 'has an alias updated_at for gewijzigd' do
      expect(subject.updated_at).to eq valid_attributes[:gewijzigd]
    end

    it 'has an alias iss_id for nr' do
      expect(subject.iss_id).to eq valid_attributes[:nr]
    end
  end
end
