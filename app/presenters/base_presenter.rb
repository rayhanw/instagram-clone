# frozen_string_literal: true

class BasePresenter
  attr_accessor :view_context

  def h
    @view_context
  end
end
