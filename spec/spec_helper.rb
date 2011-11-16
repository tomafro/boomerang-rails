require 'bundler/setup'
require 'action_controller/railtie'
require 'rails/test_unit/railtie'

module Boomerang
  class Application < Rails::Application
  end
end

require 'boomerang'

class ApplicationController < ActionController::Base
  include Boomerang::ControllerSupport
  include Rails.application.routes.url_helpers
end

require 'rspec/rails'

RSpec.configure do |config|
  config.mock_with :mocha
end