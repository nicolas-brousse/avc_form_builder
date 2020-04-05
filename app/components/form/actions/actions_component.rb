module Form
  class ActionsComponent < ApplicationComponent
    validates :form, presence: true
    validates :content, presence: true

    attr_accessor :form, :options

    def initialize(*)
      @options = {}

      super
    end
  end
end
