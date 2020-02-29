# frozen_string_literal: true

module Form
  class ErrorsHelperComponent < ActionView::Component::Base
    validates :form, presence: true
    validates :object_name, presence: true
    validates :method, presence: true

    attr_reader :form, :object_name, :method

    def initialize(form, object_name, method)
      @form = form
      @object_name = object_name
      @method = method
    end

    def object_errors
      form.object.errors.full_messages_for(method)
    end

    def object_errors?
      form.object.errors.key?(method)
    end
  end
end
