module Pages
  class HomePresenter < BasePresenter
    attr_reader :scope

    def initialize(scope)
      @scope = scope
    end

    def all
      @all ||= scope.includes(:likes, user: [avatar_attachment: [:blob]], comments: [:user], photos_attachments: [:blob])
    end
  end
end
