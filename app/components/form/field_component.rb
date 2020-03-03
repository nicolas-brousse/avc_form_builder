# frozen_string_literal: true

module Form
  class FieldComponent < ApplicationComponent
    validates :form, presence: true
    validates :object_name, presence: true
    validates :method, presence: true
    validates :options, presence: true
    validates :original, presence: true

    attr_reader :form, :object_name, :method, :options, :original

    def initialize(form, object_name, method, options, original)
      @form = form
      @object_name = object_name
      @method = method
      @options = combine_options(options)
      @original = original # Not sure about this
    end

    def object_errors
      form.object.errors.full_messages_for(method)
    end

    def object_errors?
      form.object.errors.key?(method)
    end

    protected

    def combine_options(options)
      options[:style] = "border: 2px solid red" if object_errors?
      options
    end
  end
end
