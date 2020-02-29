class ApplicationController < ActionController::Base
  ActionView::Base.default_form_builder = ::FormBuilder
end
