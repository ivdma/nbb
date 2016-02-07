if ENV['CODECLIMATE_REPO_TOKEN'] && RUBY_VERSION.include?('2.3')
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nbb'
require 'webmock/rspec'
require 'vcr'
require 'pry'
require 'fabrication'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures'
  config.hook_into :webmock
  config.ignore_hosts 'codeclimate.com'
end

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
