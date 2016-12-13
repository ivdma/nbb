require 'spec_helper'

describe Nbb::Locations do
  describe '::endpoint' do
    it 'is properly set' do
      expect(described_class.endpoint).to eq 'locatie.pl'
    end

    it 'generates a valid endpoint' do
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/locatie.pl'
    end
  end

  describe '::all' do
    it 'returns all locations' do
      VCR.use_cassette :locations_2015_2016_all do
        locations = described_class.all
        expect(locations.length).to eq 386
        expect(locations.first.org_id).to eq '3'
      end
    end

    it 'returns locations for given organization' do
      VCR.use_cassette :locations_2015_2016_for_org do
        locations = described_class.all org_id: 5
        expect(locations.length).to eq 41
        expect(locations.map(&:org_id).uniq).to eq ['5']
      end
    end

    it 'returns locations updated after date' do
      VCR.use_cassette :locations_2015_2016_updated_after do
        locations = described_class.all date: '2015-12-27 18:00:00'
        expect(locations.length).to eq 50
      end
    end
  end
end
