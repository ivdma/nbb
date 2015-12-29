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
    it 'calls Nbb::Clubs.all' do
      VCR.use_cassette :clubs_2015_2016 do
        expect(Nbb::Clubs).to receive(:all).with({}).once
        described_class.clubs
      end
    end

    it 'is the same as wrapped method' do
      VCR.use_cassette :clubs_2015_2016, allow_playback_repeats: true do
        expect(described_class.clubs.map(&:name)).to eq Nbb::Clubs.all.map(&:name)
      end
    end
  end

  describe '::club' do
    it 'calls NBB::Clubs.find' do
      VCR.use_cassette :clubs_2015_2016 do
        expect(Nbb::Clubs).to receive(:find).with(356).once
        described_class.club 356
      end
    end

    it 'returns one club' do
      VCR.use_cassette :clubs_2015_2016 do
        club = described_class.club(356)
        expect(club.name).to eq 'Celeritas-Donar'
      end
    end
  end

  describe '::competitions' do
    it 'calls Nbb::Competitions.all' do
      expect(Nbb::Competitions).to receive(:all).with({}).once
      described_class.competitions
    end

    it 'is the same as wrapped method' do
      VCR.use_cassette :competitions_2015_2016_all, allow_playback_repeats: true do
        original = Nbb::Competitions.all
        wrapper = described_class.competitions
        expect(wrapper.map(&:name)).to eq original.map(&:name)
      end
    end
  end

  describe '::teams' do
    it 'responds to ::teams' do
      expect(described_class).to respond_to :teams
    end

    it 'calls Nbb::Teams.all' do
      VCR.use_cassette :teams_celeritas_2015_2016 do
        club_id = 356
        expect(Nbb::Teams).to receive(:all).with(club_id: club_id).once
        described_class.teams club_id: club_id
      end
    end

    it 'is the same as wrapped method' do
      VCR.use_cassette :teams_celeritas_2015_2016, allow_playback_repeats: true do
        original = Nbb::Teams.all club_id: 356
        wrapper = described_class.teams club_id: 356
        expect(wrapper.map(&:name)).to eq original.map(&:name)
      end
    end
  end
end
