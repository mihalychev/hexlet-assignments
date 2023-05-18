# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_group 'Lib', 'lib'
  add_filter 'spec/'
end

require 'ipgeobase'
require 'webmock/rspec'

SPECS_ROOT_DIR = File.dirname(__FILE__)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
