require 'spec_helper'

describe Nbb::Base do
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

  describe '::response' do
    it 'creates a response' do
      params = 'http://db.basketball.nl/db/json/foo.pl?org_id=123'
      allow(described_class).to receive(:endpoint).and_return 'foo.pl'
      allow(HTTParty).to receive(:get).with(params).and_return(:foo)
      expect(described_class.response org_id: 123).to eq :foo
    end
  end
end
