require_relative "boot"

require "rails/all"
require "action_view/component/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AvcFormBuilder
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.autoload_paths += %w[lib/]
    config.action_view.field_error_proc = Proc.new { |html_tag, _instance| html_tag.html_safe
}

    autoloader = Rails.autoloaders.main
    autoloader.collapse("app/components/*")
    autoloader.collapse("app/components/form/*")
  end
end
