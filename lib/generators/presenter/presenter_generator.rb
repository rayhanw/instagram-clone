class PresenterGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)
  argument :controller_name, type: :string
  argument :action_name, type: :string
  class_option :module, type: :string

  def create_presenter_file
    presenter_path = "app/presenters"
    presenter_base_folder_path = "#{presenter_path}/#{controller_name}"
    presenter_file_path = "#{presenter_base_folder_path}/#{action_name}_presenter.rb"

    Dir.mkdir(presenter_base_folder_path) unless File.exist? presenter_base_folder_path
    # Dir.mkdir(presenter_file_path) unless File.exist? presenter_file_path

    create_file presenter_file_path, "module #{controller_name.camelize}
  class #{action_name.camelize}Presenter < BasePresenter
  end
end" unless File.exist? presenter_file_path
  end
end
