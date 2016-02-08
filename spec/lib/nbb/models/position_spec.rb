require 'spec_helper'

describe Nbb::Models::Position do
  it 'is Models::Base' do
    expect(described_class.new).to be_a Nbb::Models::Position
  end

  describe 'initialization' do
    subject { Fabricate(:position) }

    context 'valid' do
      it 'parses afko' do
        expect(subject.afko).to eq 'Celeritas-Donar HS 5'
      end

      it 'parses ID' do
        expect(subject.ID).to eq 2569
      end

      it 'parses status' do
        expect(subject.status).to eq 'Actief'
      end

      it 'parses rang' do
        expect(subject.rang).to eq 1
      end

      it 'parses gespeeld' do
        expect(subject.gespeeld).to eq 12
      end

      it 'parses percentage' do
        expect(subject.percentage).to eq 84.4
      end

      it 'parses tegenscore' do
        expect(subject.tegenscore).to eq 0
      end

      it 'parses punten' do
        expect(subject.punten).to eq 25
      end

      it 'parses eigenscore' do
        expect(subject.eigenscore).to eq 200
      end

      it 'parses datum' do
        expect(subject.datum).to eq '2016-01-30'
      end

      it 'parses team' do
        expect(subject.team).to eq 'Celeritas-Donar Heren 5'
      end

      it 'parses saldo' do
        expect(subject.saldo).to eq 100
      end

      it 'parses positie' do
        expect(subject.positie).to eq 1
      end
    end

    context 'invalid' do
      it 'does not assign methods that are not defined in ATTRIBUTES' do
        expect(described_class.new(foo: :bar)).to_not respond_to :foo
      end
    end
  end

  describe 'aliasses' do
    subject { Fabricate :position }

    it 'aliases abbreviation to afko' do
      expect(subject.abbreviation).to eq subject.afko
    end

    it 'aliases competition_id to ID' do
      expect(subject.competition_id).to eq subject.ID
    end

    it 'aliases rank to rang' do
      expect(subject.rank).to eq subject.rang
    end

    it 'aliases played to gespeeld' do
      expect(subject.played).to eq subject.gespeeld
    end

    it 'aliases points to punten' do
      expect(subject.points).to eq subject.punten
    end

    it 'aliases date to datum' do
      expect(subject.date).to eq subject.datum
    end

    it 'aliases balance to saldo' do
      expect(subject.balance).to eq subject.saldo
    end

    it 'aliases position to positie' do
      expect(subject.position).to eq subject.positie
    end
  end
end
