module Pages
  class HomePresenter < BasePresenter
    attr_reader :scope

    def initialize(scope)
      @scope = scope
    end

    def all
      @all ||= scope.includes(:user)
    end
  end
end
