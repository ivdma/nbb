require 'spec_helper'

describe Nbb do
  describe 'VERSION' do
    it 'has a MAJOR version' do
      expect(NBB::MAJOR).not_to be nil
    end

    it 'has a MINOR version' do
      expect(NBB::MINOR).not_to be nil
    end

    it 'has a TINY version' do
      expect(NBB::TINY).not_to be nil
    end

    it 'has a version that equals MAJOR.MINOR.TINY version' do
      expect(NBB::VERSION).to eq "#{NBB::MAJOR}.#{NBB::MINOR}.#{NBB::TINY}"
    end
  end

  describe '::clubs' do
    it 'returns json with clubs' do
      VCR.use_cassette :clubs_2015_2016 do
        clubs = described_class.clubs
        expect(clubs.length).to eq 331
        expect(clubs.map(&:naam)).to include 'BV Penta'
      end
    end
  end

  describe '::teams' do
    it 'responds to ::teams' do
      expect(described_class).to respond_to :teams
    end

    it 'requires clb_ID or club_id in params' do
      expect do
        described_class.teams
      end.to raise_error ArgumentError, 'Missing `clb_ID` (or `club_id`) parameter.'
    end

    it 'returns teams based on club_id' do
      VCR.use_cassette :teams_celeritas_2015_2016 do
        teams = described_class.teams(club_id: 356)
        expect(teams.length).to eq 36
        expect(teams.map(&:naam)).to include 'Heren 5'
      end
    end
  end
end
