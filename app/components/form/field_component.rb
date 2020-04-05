# frozen_string_literal: true

module Form
  class FieldComponent < ApplicationComponent
    validates :form, presence: true
    validates :object_name, presence: true
    validates :method, presence: true
    validates :original, presence: true

    attr_accessor :form, :object_name, :method, :options, :original

    def initialize(*)
      set_defaults!

      super

      @options[:style] = "border: 2px solid red" if object_errors?
    end

    def object_errors
      form.object.errors.full_messages_for(method)
    end

    def object_errors?
      form.object.errors.key?(method)
    end

    protected

    def set_defaults!; end
  end
end
