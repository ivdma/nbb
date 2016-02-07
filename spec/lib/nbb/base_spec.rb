require 'spec_helper'

describe Nbb::Base do
  before do
    allow(described_class).to receive(:json_root).and_return 'foos'
  end

  describe 'format' do
    it 'defines format' do
      expect(described_class.format).to eq :json
    end
  end

  describe '::base_url' do
    it 'defines base_url' do
      expect(described_class.base_url).to eq 'http://db.basketball.nl/db'
    end
  end

  describe '::url' do
    it 'generates url based on endpoint' do
      allow(described_class).to receive(:endpoint).and_return :foo
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/foo'
    end
  end

  describe '::raw_response' do
    it 'returns raw parsed json' do
      VCR.use_cassette :matches_2015_2016_all do
        allow(described_class).to receive(:endpoint).and_return('wedstrijd.pl')
        result = described_class.raw_response(wed_ID: 700_068)
        expect(result['seizoen']).to eq '2015-2016'
        expect(result['wedstrijden'].size).to eq 1
      end
    end
  end

  describe '::response' do
    before do
      allow(described_class).to receive(:model).and_return(Nbb::Models::Match)
      allow(described_class).to receive(:endpoint).and_return(Nbb::Matches.endpoint)
      allow(described_class).to receive(:json_root).and_return(Nbb::Matches.json_root)
    end

    it 'parses json into a provided PORO' do
      VCR.use_cassette :matches_2015_2016_all do
        result = described_class.response(wed_ID: 700_068)
        expect(result.first).to be_a Nbb::Models::Match
      end
    end
  end
end
