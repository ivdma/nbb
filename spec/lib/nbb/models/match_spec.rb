require 'spec_helper'

describe Nbb::Models::Match do
  describe 'aliases' do
    subject { Fabricate :match }

    it 'loc_id to location_id' do
      expect(subject.location_id).to eq subject.loc_id
    end

    it 'cmp_id to competition_id' do
      expect(subject.competition_id).to eq subject.cmp_id
    end

    it 'org_id to organization_id' do
      expect(subject.organization_id).to eq subject.org_id
    end

    it 'cmp_nr to competition_number' do
      expect(subject.competition_number).to eq subject.cmp_nr
    end

    it 'nr to number' do
      expect(subject.number).to eq subject.nr
    end

    it 'datum to date' do
      expect(subject.date).to eq subject.datum
    end

    it 'thuis_club_id to home_club_id' do
      expect(subject.home_club_id).to eq subject.thuis_club_id
    end

    it 'uit_club_id to away_club_id' do
      expect(subject.away_club_id).to eq subject.uit_club_id
    end

    it 'thuis_ploeg_id to home_team_id' do
      expect(subject.home_team_id).to eq subject.thuis_ploeg_id
    end

    it 'uit_ploeg_id to away_team_id' do
      expect(subject.away_team_id).to eq subject.uit_ploeg_id
    end

    it 'thuis_ploeg to home_team' do
      expect(subject.home_team).to eq subject.thuis_ploeg
    end

    it 'uit_ploeg to away_team' do
      expect(subject.away_team).to eq subject.uit_ploeg
    end

    it 'score_thuis to home_score' do
      expect(subject.home_score).to eq subject.score_thuis
    end

    it 'score_uit to away_score' do
      expect(subject.away_score).to eq subject.score_uit
    end
  end
end
