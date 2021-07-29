require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module RubyOnRailsExam2
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'West Central Africa'
    config.active_record.default_timezone = :local
  end
end
