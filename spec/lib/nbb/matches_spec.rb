require 'spec_helper'

describe Nbb::Matches do
  describe '::endpoint' do
    it 'is properly set' do
      expect(described_class.endpoint).to eq 'wedstrijd.pl'
    end

    it 'generates a valid endpoint' do
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/wedstrijd.pl'
    end
  end

  describe '::all' do
    it 'returns all competitions' do
      VCR.use_cassette :matches_2015_2016_all do
        matches = described_class.all
        expect(matches.length).to eq 110
        expect(matches.first.thuis_ploeg).to eq 'BV Hoofddorp HS 1'
      end
    end

    describe 'filtering' do
      it 'can filter by cmp_ID' do
        VCR.use_cassette :matches_2015_2016_all do
          matches = described_class.all cmp_ID: 2530
          expect(matches.size).to eq 133
          expect(matches.first.thuis_ploeg).to eq 'SIETSEMA Highlanders HS 1'
        end
      end

      it 'can filter by clb_ID' do
        VCR.use_cassette :matches_2015_2016_all do
          matches = described_class.all clb_ID: 356
          expect(matches.size).to eq 585
          expect(matches.first.thuis_ploeg).to eq 'Celeritas-Donar HS 1'
        end
      end

      it 'can filter by date' do
        VCR.use_cassette :matches_2015_2016_all do
          matches = described_class.all date: '2016-01-01 00:00:00', clb_ID: 356
          expect(matches.size).to eq 90
          expect(matches.first.thuis_ploeg).to eq 'Celeritas-Donar D0 1'
        end
      end

      it 'can filter by loc_ID' do
        VCR.use_cassette :matches_2015_2016_all do
          matches = described_class.all loc_ID: 768
          expect(matches.size).to eq 407
          expect(matches.first.thuis_ploeg).to eq 'Celeritas-Donar D0 1'
        end
      end

      it 'can filter by plg_ID' do
        VCR.use_cassette :matches_2015_2016_all do
          matches = described_class.all plg_ID: 3746
          expect(matches.size).to eq 22
          expect(matches.first.thuis_ploeg).to eq 'Celeritas-Donar HS 5'
        end
      end

      it 'can filter by wed_ID' do
        VCR.use_cassette :matches_2015_2016_all do
          matches = described_class.all wed_ID: 700_068
          expect(matches.size).to eq 1
          expect(matches.first.thuis_ploeg).to eq 'Celeritas-Donar HS 5'
        end
      end
    end
  end
end
