# frozen_string_literal: true

module Form
  class ErrorsHelperComponent < ApplicationComponent
    validates :form, presence: true
    validates :method, presence: true

    attr_accessor :form, :method, :options

    def initialize(*)
      @options = {}

      super
    end

    def object_errors
      form.object.errors.full_messages_for(method)
    end

    def object_errors?
      form.object.errors.key?(method)
    end
  end
end
