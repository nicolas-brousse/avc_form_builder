module Form
  class GroupComponent < ApplicationComponent
    validates :form, presence: true
    validates :object_name, presence: true
    validates :method, presence: true
    validates :content, presence: true

    attr_accessor :form, :object_name, :method, :options

    def initialize(*)
      super
    end
  end
end
