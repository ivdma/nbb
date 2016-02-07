require 'spec_helper'

describe Nbb::Models::Team do
  it 'is Models::Base' do
    expect(described_class.new).to be_a Nbb::Models::Team
  end

  describe 'initialization' do
    subject { Fabricate :team }

    context 'valid' do
      it 'parses id' do
        expect(subject.id).to eq 1
      end

      it 'parses comp_id' do
        expect(subject.comp_id).to eq 1
      end

      it 'parses naam' do
        expect(subject.naam).to eq 'Heren 5'
      end

      it 'parses club_id' do
        expect(subject.club_id).to eq 1
      end
    end

    context 'invalid' do
      it 'does not assign methods that are not defined in ATTRIBUTES' do
        expect(described_class.new(foo: :bar)).to_not respond_to :foo
      end
    end
  end

  describe 'aliasses' do
    subject { Fabricate :team }

    it 'name to naam' do
      expect(subject.name).to eq subject.naam
    end

    it 'competition_id to comp_id' do
      expect(subject.competition_id).to eq subject.comp_id
    end
  end
end
