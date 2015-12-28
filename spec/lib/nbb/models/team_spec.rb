require 'spec_helper'

describe Nbb::Models::Team do

  let(:valid_attributes) do
    {
      id: '123',
      comp_id: '456',
      naam: 'Heren 5',
      club_id: '2'
    }
  end

  it 'is Models::Base' do
    expect(described_class.new).to be_a Nbb::Models::Team
  end

  describe 'initialization' do
    subject { described_class.new(valid_attributes) }

    context 'valid' do
      it 'parses id' do
        expect(subject.id).to eq valid_attributes[:id]
      end

      it 'parses comp_id' do
        expect(subject.comp_id).to eq valid_attributes[:comp_id]
      end

      it 'parses naam' do
        expect(subject.naam).to eq valid_attributes[:naam]
      end

      it 'parses club_id' do
        expect(subject.club_id).to eq valid_attributes[:club_id]
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

    it 'aliases naam to name' do
      expect(subject.name).to eq valid_attributes[:naam]
    end
  end
end
