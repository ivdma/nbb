require 'spec_helper'

describe Nbb::Teams do
  describe '::endpoint' do
    it 'is properly set' do
      expect(described_class.endpoint).to eq 'team.pl'
    end

    it 'generates a valid endpoint' do
      expect(described_class.url).to eq 'http://db.basketball.nl/db/json/team.pl'
    end
  end

  describe '::all' do
    it 'requires clb_ID or club_id in params' do
      expect do
        described_class.all
      end.to raise_error ArgumentError, 'Missing `clb_ID` (or `club_id`) parameter.'
    end

    it 'returns all teams for given club' do
      VCR.use_cassette :teams_celeritas_2015_2016 do
        teams = described_class.all(club_id: 356)
        expect(teams.length).to eq 36
        expect(teams.map(&:naam)).to include 'Heren 5'
      end
    end
  end
end
