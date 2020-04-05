module ResourcePresenters
  class UserPresenter < ResourcePresenters::ResourcePresenterBase
    def comments
      @comments ||= user.comments
    end

    def likes
      @likes ||= user.likes
    end

    def comments_count
      @comments_count ||= comments.count
    end

    def likes_count
      @likes_count ||= likes.count
    end

    def posts
      @posts ||= user.posts.with_photo_blobs
    end

    def direct_messages
      @direct_messages ||= user.direct_messages.with_sender_avatar.with_receiver_avatar
    end

    def posts_count
      @posts_count ||= user.posts.count
    end

    def bookmarks
      @bookmarks ||= user.bookmarks.with_post_photos
    end
  end
end
