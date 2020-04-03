module Pages
  class HomePresenter < BasePresenter
    attr_reader :scope, :current_page

    def initialize(scope, current_page)
      @scope = scope
      @current_page = current_page
    end

    def all
      @all ||= scope.with_photo_blobs.sorted_by_date.includes(:likes, user: [avatar_attachment: [:blob]], comments: [:user]).paginate(page: current_page, per_page: 8)
    end
  end
end
