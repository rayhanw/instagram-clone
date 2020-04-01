module Presenters
  def present(*args)
    klass = "#{params[:controller].camelize}::#{params[:action].camelize}Presenter".constantize
    presenter = klass.new(args)
    presenter.view_context = view_context

    presenter
  end
end
