require 'spec_helper'

describe Nbb::Positions do
  describe '::endpoint' do
    it 'is properly set' do
      expect(described_class.endpoint).to eq 'stand.pl'
    end

    it 'generates a valid endpoint' do
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/stand.pl'
    end
  end

  describe '::json_root' do
    it 'defines a root of the JSON collection' do
      expect(described_class.json_root).to eq 'stand'
    end
  end

  describe '::model' do
    it 'defines the model which should be addressed' do
      expect(described_class.model).to eq Nbb::Models::Position
    end
  end

  describe '::all' do
    it 'requires cmp_ID' do
      expect { described_class.all }.to raise_error ArgumentError, 'Missing `cmp_ID` (or `competition_id`) parameter.'
    end

    it 'fetches positions for a competition' do
      VCR.use_cassette :positions_2015_2016 do
        expect(described_class.all(competition_id: 2530).size).to eq 12
      end
    end

    it 'has 9 active teams' do
      VCR.use_cassette :positions_2015_2016 do
        positions = described_class.all(competition_id: 2530)
        expect(positions.count { |position| position.status == Nbb::Models::Position::ACTIVE }).to eq 9
      end
    end
  end
end
