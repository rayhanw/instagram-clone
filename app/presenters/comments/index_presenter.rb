module Comments
  class IndexPresenter < BasePresenter
    attr_reader :post, :comments, :new_comment

    def initialize(post)
      @post = post
      @comments = post.comments.includes(user: [avatar_attachment: :blob])
      @new_comment = Comment.new
    end
  end
end
