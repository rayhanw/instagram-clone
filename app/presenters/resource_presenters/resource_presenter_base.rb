module ResourcePresenters
  class ResourcePresenterBase
    attr_reader :resource

    def initialize(resource)
      @resource = resource
      model_name = resource.model_name.to_s.underscore
      instance_variable_set("@#{model_name}", resource)

      self.class.send(:attr_reader, model_name)
    end

    def url_helpers
      @url_helpers ||= Rails.application.routes.url_helpers
    end
  end
end
