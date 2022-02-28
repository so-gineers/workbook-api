# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'action_mailbox/engine'
# require 'action_text/engine'
# require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
# require 'action_cable/engine'
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module WorkookApi
  # Application class
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_record.schema_format = :ruby
    config.api_only = true
    config.autoload_paths << config.root.join('lib')
    config.eager_load_paths << config.root.join('lib')
    config.generators do |generator|
      generator.orm :active_record, primary_key_type: :uuid
    end

    ENV['WORKBOOK_APP_HOSTS'].split.each do |host|
      config.hosts << host.compact
    end
  end
end
