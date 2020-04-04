module ResourcePresenters
  class UserPresenter < ResourcePresenters::ResourcePresenterBase
    def comments_count
      @comments_count ||= user.comments.count
    end

    def likes_count
      @likes_count ||= user.likes.count
    end

    def posts
      @posts ||= user.posts.with_photo_blobs
    end

    def direct_messages
      @direct_messages ||= user.direct_messages.with_users_avatar
    end

    def posts_count
      @posts_count ||= user.posts.count
    end
  end
end
