module ResourcePresenters
  class PostPresenter < ResourcePresenterBase
    def share_link(base_url)
      @share_link ||= base_url + url_helpers.post_path(post)
    end
  end
end
