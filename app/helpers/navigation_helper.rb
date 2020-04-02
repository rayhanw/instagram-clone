module NavigationHelper
  def at_root?
    params[:controller] == 'pages' && params[:action] == 'home'
  end

  def data_target
    "click->scroll-top#scrollUp"
  end
end
