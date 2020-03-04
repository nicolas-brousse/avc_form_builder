# frozen_string_literal: true

# FormBuilder
class FormBuilder < ActionView::Helpers::FormBuilder
  # (field_helpers - [:label, :check_box, :radio_button, :fields_for, :fields, :hidden_field, :file_field]).each do |selector|
  %i[text_field text_area datetime_field datetime_select].each do |selector|
    component_klassname = "Form::#{selector.to_s.classify}Component"

    unless component_klassname.constantize < ViewComponent::Base
      raise NameError, "Component #{component_klassname} doesn't exists" \
        " or is not a ViewComponent::Base class"
    end

    class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
      alias original_#{selector} #{selector}
      def #{selector}(method, options = {})
        render_component(
          #{component_klassname}.new(
            form: self,
            object_name: @object_name,
            method: method,
            options: objectify_options(options),
            original: super
          )
        )
      end
    RUBY_EVAL
  end

  def group(method, options = {}, &block)
    component = Form::GroupComponent.new(form: self,
                                         method: method,
                                         object_name: object_name,
                                         options: objectify_options(options))
    render_component(component, &block)
  end

  def actions(options = {}, &block)
    component = Form::ActionsComponent.new(form: self,
                                           options: objectify_options(options))
    render_component(component, &block)
  end

  def errors(method, options = {})
    component = Form::ErrorsHelperComponent.new(form: self,
                                                method: method,
                                                options: objectify_options(options))
    render_component(component, &block)
  end

  private

  def render_component(component, &block)
    component.render_in(@template, &block)
  end
end
