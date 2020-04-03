module ResourcePresenters
  class UserPresenter < ResourcePresenters::ResourcePresenterBase
    def hi
      @hi ||= "Hello world!"
    end
  end
end
