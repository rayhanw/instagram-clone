# frozen_literal_string: true

# Module that adds the present method to any inclusion.
# present will constantize the current controller + action and
# return the presenter for that context
module Presenters
  def present(*objects)
    klass = "#{params[:controller].camelize}::#{params[:action].camelize}Presenter".constantize
    presenter = klass.new(*objects)
    presenter.view_context = view_context
    presenter
  end
end
