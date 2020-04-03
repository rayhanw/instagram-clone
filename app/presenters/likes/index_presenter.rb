module Likes
  class IndexPresenter < BasePresenter
    attr_reader :likes

    def initialize(likes)
      @likes = likes
    end
  end
end
