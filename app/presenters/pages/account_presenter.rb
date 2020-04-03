module Pages
  class AccountPresenter < BasePresenter
    attr_reader :user, :posts, :comments, :likes

    def initialize(user)
      @user = user
      @posts = user.posts
      @comments = user.comments
      @likes = user.likes
    end

    def posts_count
      @posts_count ||= posts.count
    end

    def comments_count
      @comments_count ||= comments.count
    end

    def likes_count
      @likes_count ||= likes.count
    end
  end
end
