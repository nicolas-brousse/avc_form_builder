class ApplicationComponent < ViewComponent::Base
  include ActiveModel::Model

  class << self
    def matching_views_in_source_location
      return [] unless source_location

      (Dir["#{source_location.chomp(File.extname(source_location)).chomp("_component")}.*{#{ActionView::Template.template_handler_extensions.join(',')}}"] - [source_location])
    end
  end

  # See: https://github.com/stimulusjs/stimulus/blob/7f58b5597292e88423c3fa9ccd0e6f25ffc83192/packages/%40stimulus/webpack-helpers/src/index.ts#L31
  def stimulus_controller_name
    self.class.name.underscore
      .gsub(/_component$/, "")
      .gsub(/_/, "-")
      .gsub(/\//, "--")
  end
end
