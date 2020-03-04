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

    config.paths.add "app/components", eager_load: true # , glob: "**/*_component.rb"

    Rails.autoloaders.each do |autoloader|
      # components_path = Rails.root.join("app/components")

      # components_path.glob("**/*_component.rb").each do |component_path|
      #   path = component_path.to_s.gsub(components_path.to_s, "").chomp("_component.rb")
      #   binding.irb
      #   autoloader.collapse("app/components/button")
      # end
      autoloader.collapse("app/components/button")
      autoloader.collapse("app/components/form/text_field")
      autoloader.collapse("app/components/form/text_area")
      autoloader.collapse("app/components/form/datetime_field")
      autoloader.collapse("app/components/form/datetime_select")
      autoloader.collapse("app/components/form/group")
      autoloader.collapse("app/components/form/errors_helper")
      autoloader.collapse("app/components/form/actions")
      autoloader.collapse("app/components/form/submit")
    end
  end
end
