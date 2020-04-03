class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def present
    "ResourcePresenters::#{model_name}Presenter".constantize.new(self)
  end
end
