# frozen_string_literal: true

module Form
  class TextAreaComponent < FieldComponent
    def initialize(*)
      super
    end

    def options
      super.merge(
        class: "bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"
      )
    end

    protected

    def set_defaults!
      @options = {
        rows: 5,
        cols: 50
      }
    end
  end
end
