class Search::CommonPresenter
  AVAILABLE_VIEWS = %i(table grid)
  def initialize

  end

  def view_switcher(context)
    context.render 'view_switcher', views: AVAILABLE_VIEWS
  end
end