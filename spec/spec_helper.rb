require 'bundler/setup'
require 'action_controller/railtie'
require 'rails/test_unit/railtie'

module Boomerang
  class Application < Rails::Application
  end
end

require 'boomerang'
Boomerang.setup

class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers
end

require 'rspec/rails'

RSpec.configure do |config|
  config.mock_with :mocha
end