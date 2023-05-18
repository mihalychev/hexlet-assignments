# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in ipgeobase.gemspec
gemspec

gem 'rake', '~> 13.0'

group :development do
  gem 'rubocop', '~> 1.21'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock'
end

group :development, :test do
  gem 'rspec', '~> 3.0'
end
