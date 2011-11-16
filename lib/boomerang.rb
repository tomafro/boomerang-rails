require 'boomerang/version'
require 'boomerang/railtie' if defined?(Rails)

module Boomerang
  autoload :ControllerSupport, 'boomerang/controller_support'

  def self.setup
    ActionController::Base.send :include, ControllerSupport
  end
end
