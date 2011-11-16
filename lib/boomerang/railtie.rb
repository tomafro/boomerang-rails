require 'boomerang'

class Boomerang::Railtie < Rails::Railtie
  initializer 'boomerang.action_controller' do
    ActiveSupport.on_load :action_controller do
      Boomerang.setup
    end
  end
end
