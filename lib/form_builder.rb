# frozen_string_literal: true

# FormBuilder
class FormBuilder < ActionView::Helpers::FormBuilder
  # (field_helpers - [:label, :check_box, :radio_button, :fields_for, :fields, :hidden_field, :file_field]).each do |selector|
  %i[text_field text_area datetime_field datetime_select].each do |selector|
    component_klass = "Form::#{selector.to_s.classify}Component".safe_constantize

    unless component_klass.is_a?(Class) && component_klass < ActionView::Component::Base
      raise NameError, "Component #{component_klass} doesn't exists" \
        " or is not a ActionView::Component::Base class"
    end

    class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
      alias original_#{selector} #{selector}
      def #{selector}(method, options = {})
        render_component(
          #{component_klass.inspect}.new(self,
            @object_name,
            method,
            objectify_options(options),
            super
          )
        )
      end
    RUBY_EVAL
  end

  def group(method, options = {}, &block)
    component = Form::GroupComponent.new(self, @object_name, method,
                                         objectify_options(options))
    render_component(component, &block)
  end

  def actions(options = {}, &block)
    component = Form::ActionsComponent.new(self, objectify_options(options))
    render_component(component, &block)
  end

  def errors(method, options = {})
    component = Form::ErrorsHelperComponent.new(self, @object_name, method,
                                                objectify_options(options))
    render_component(component, &block)
  end

  private

  def render_component(component, &block)
    component.render_in(@template, &block)
  end
end
