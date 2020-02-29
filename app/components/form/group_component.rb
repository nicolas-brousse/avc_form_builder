module Form
  class GroupComponent < ActionView::Component::Base
    validates :form, presence: true
    validates :object_name, presence: true
    validates :method, presence: true
    validates :options, presence: true
    validates :content, presence: true

    attr_reader :form, :object_name, :method, :options

    def initialize(form, object_name, method, options)
      @form = form
      @object_name = object_name
      @method = method
      @options = options
    end
  end
end
