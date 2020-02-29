# frozen_string_literal: true

module Form
  class TextAreaComponent < FieldComponent
    def initialize(*)
      super
    end

    protected

    def combine_options(options)
      super.merge({
        rows: 5,
        cols: 50,
      })
    end
  end
end
