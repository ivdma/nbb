require 'spec_helper'

describe Nbb::Clubs do
  describe '::endpoint' do
    it 'is properly set' do
      expect(described_class.endpoint).to eq 'club.pl'
    end

    it 'generates a valid endpoint' do
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/club.pl'
    end
  end

  describe '::all' do
    it 'returns all clubs for current season with no options provided' do
      VCR.use_cassette :clubs_2015_2016 do
        clubs = described_class.all
        expect(clubs.length).to eq 331
        expect(clubs.map(&:naam)).to include 'BV Penta'
      end
    end
  end
end
