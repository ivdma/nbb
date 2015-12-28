require "codeclimate-test-reporter"
CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nbb'
require 'webmock/rspec'
require 'vcr'
require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures"
  c.hook_into :webmock
end
