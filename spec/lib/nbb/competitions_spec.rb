require 'spec_helper'

describe Nbb::Competitions do
  describe '::endpoint' do
    it 'is properly set' do
      expect(described_class.endpoint).to eq 'competities.pl'
    end

    it 'generates a valid endpoint' do
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/competities.pl'
    end
  end

  describe '::all' do
    it 'returns all competitions' do
      VCR.use_cassette :competitions_2015_2016_all do
        competitions = described_class.all
        expect(competitions.length).to eq 612
        expect(competitions.first.org_id).to eq '5'
      end
    end

    it 'returns competitions for given organization' do
      VCR.use_cassette :competitions_2015_2016_for_org do
        competitions = described_class.all organization_id: 5
        expect(competitions.length).to eq 36
        expect(competitions.map(&:org_id).uniq).to eq ['5']
      end
    end

    it 'returns competitions updated after date' do
      VCR.use_cassette :competitions_2015_2016_updated_after do
        competitions = described_class.all date: '2015-12-27 18:00:00'
        expect(competitions.length).to eq 34
      end
    end
  end
end
