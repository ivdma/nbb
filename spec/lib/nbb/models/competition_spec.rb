require 'spec_helper'

describe Nbb::Models::Competition do
  it 'is Nbb::Models::Competition' do
    expect(described_class.new).to be_a Nbb::Models::Competition
  end

  describe 'initialization' do
    subject { Fabricate :competition }

    context 'valid' do
      it 'parses id' do
        expect(subject.id).to eq 1
      end

      it 'parses org_id' do
        expect(subject.org_id).to eq 1
      end

      it 'parses gewijzigd' do
        expect(subject.gewijzigd).to match(/2015-12-12/)
      end

      it 'parses naam' do
        expect(subject.naam).to match 'HS 3b'
      end

      it 'parses nr' do
        expect(subject.nr).to eq 1
      end
    end

    context 'invalid' do
      it 'does not assign methods that are not defined in ATTRIBUTES' do
        expect(described_class.new(foo: :bar)).to_not respond_to :foo
      end
    end
  end

  describe 'aliasses' do
    subject { Fabricate :competition }

    it 'has an alias name for naam' do
      expect(subject.name).to eq 'Nrd HS 3b'
    end

    it 'has an alias organization_id for org_id' do
      expect(subject.organization_id).to eq 1
    end

    it 'has an alias updated_at for gewijzigd' do
      expect(subject.updated_at).to eq '2015-12-12 13:45:00'
    end

    it 'has an alias iss_id for nr' do
      expect(subject.iss_id).to eq 1
    end
  end
end
