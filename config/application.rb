require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MongoidActiveRecordBridge
  class Application < Rails::Application
    # Set FactoryGirl factories directory.
    config.generators do |config|
      config.factory_girl :dir => 'spec/support/factories'
    end
  end
end
