# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_marketplace/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'spree_multi_vendor'
  spec.version     = SpreeMarketplace.version
  spec.summary     = 'Spree marketplace extension'
  spec.description = 'Spree marketplace extension'
  spec.required_ruby_version = '>= 2.3.3'

  spec.author    = ["VeroLa Srl."]
  spec.email     = ["mateo.laino@gmail.com"]
  spec.homepage  = "https://github.com/MateoLa"
  spec.license   = "MIT"

  # spec.files       = `git ls-files`.split("\n")
  # spec.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_path = 'lib'
  spec.requirements << 'none'

  spree_version = '>= 3.2.0', '< 5.0'
  spec.add_dependency 'spree_core', spree_version
  spec.add_dependency 'spree_backend', spree_version
  spec.add_dependency 'spree_extension'
  spec.add_dependency 'deface', '~> 1.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'capybara-screenshot'
  spec.add_development_dependency 'capybara-select-2'
  spec.add_development_dependency 'chromedriver-helper'
  spec.add_development_dependency 'coffee-rails'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'factory_bot', '~> 4.7'
  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency 'mysql2'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'puma'
  spec.add_development_dependency 'rails-controller-testing'
  spec.add_development_dependency 'rspec-rails', '~> 4.0.0.beta2'
  spec.add_development_dependency 'sass-rails'
  spec.add_development_dependency 'selenium-webdriver'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3'
end
