class ButtonComponent < ApplicationComponent
  validates :content, presence: true

  attr_accessor :title, :href

  def initialize(*); super; end

  def content
    super || @title
  end

  def link?
    href.present?
  end
end
