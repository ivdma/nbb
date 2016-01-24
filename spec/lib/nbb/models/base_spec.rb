require 'spec_helper'

module Nbb
  module Models
    class TestEntity < Nbb::Models::Base
      ATTRIBUTES = [:foo].freeze
      attr_accessor(*ATTRIBUTES)
    end
  end
end

describe Nbb::Models::Base do
  it 'infers classname of inherited class' do
    test_class = Nbb::Models::TestEntity.new(foo: :bar)
    expect(test_class.foo).to eq :bar
  end
end
