class Form::ActionsComponent < ApplicationComponent
  validates :form, presence: true
  validates :options, presence: true
  validates :content, presence: true

  attr_reader :form, :options

  def initialize(form, options = {})
    @form = form
    @options = options
  end
end
