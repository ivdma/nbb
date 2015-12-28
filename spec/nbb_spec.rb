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
end
