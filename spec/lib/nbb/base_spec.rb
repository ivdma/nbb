require 'spec_helper'

describe Nbb::Base do
  it 'defines format' do
    expect(described_class.format).to eq :json
  end

  it 'defines base_url' do
    expect(described_class.base_url).to eq 'http://db.basketball.nl/db'
  end

  it 'generates url with endpoint' do
    allow(described_class).to receive(:endpoint).and_return :foo
    expect(described_class.url).to eq 'http://db.basketball.nl/db/json/foo'
  end
end
