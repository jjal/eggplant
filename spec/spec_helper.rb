require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Spork.prefork do
  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true

    config.include FactoryGirl::Syntax::Methods
  end
end
