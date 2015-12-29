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

    it 'returns a subset of clubs based on organization_id' do
      VCR.use_cassette :clubs_2015_2016_suborg do
        clubs = described_class.all organization_id: 6
        expect(clubs.length).to eq 63
        expect(clubs.map(&:naam)).to include 'Windmills'
      end
    end

    it 'returns clubs updated after date' do
      VCR.use_cassette :clubs_2015_2016_date do
        clubs = described_class.all date: '2015-12-28 18:30:00'
        expect(clubs.length).to eq 1
        expect(clubs.first.naam).to eq 'Green Eagles'
      end
    end
  end

  describe '::find' do
    it 'returns single club from list of clubs based on id' do
      VCR.use_cassette :clubs_2015_2016 do
        club = described_class.find 356
        expect(club.naam).to eq 'Celeritas-Donar'
      end
    end
  end
end
