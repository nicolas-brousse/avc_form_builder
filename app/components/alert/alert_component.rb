class AlertComponent < ApplicationComponent
  validates :content, presence: true

  attr_accessor :type, :message

  def initialize(*); super; end

  def content
    super || @message
  end

  def type_class
    {
      notice: "alert--notice",
      alert:  "alert--alert",
    }[@type.to_sym]
  end
end
