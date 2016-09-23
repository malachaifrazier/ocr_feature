require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OcrFeature
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.active_record.default_timezone = :utc

    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.fixture_replacement :factory_girl
    end

    config.action_controller.action_on_unpermitted_parameters = :raise

    config.active_record.raise_in_transactional_callbacks = true
  end
end
