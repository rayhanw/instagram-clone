module ResourcePresenters
  class PostPresenter < ResourcePresenterBase
    def any_comments?
      @any_comments ||= post.comments.any?
    end

    def user
      @user ||= post.user
    end

    def comments
      @comments ||= post.comments
    end

    def created_at
      @created_at ||= post.created_at
    end

    def first_photo
      @first_photo ||= post.photos[0].key
    end

    def id
      @id ||= post.id
    end

    def likes
      @likes ||= post.likes
    end

    def liked_by_user?(user)
      likes.map(&:user).include? user
    end

    def any_likes?
      @any_likes ||= likes.any?
    end

    def first_and_last_comments
      @first_and_last_comments ||= [*[post.first_comment] + post.last_comments].uniq.compact
    end

    def first_comment?(comment)
      comments.first == comment
    end
  end
end
