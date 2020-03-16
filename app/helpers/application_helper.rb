module ApplicationHelper
  def current_class?(test_path)
    if request.path == test_path
      return 'is-selected'
    else
      return 'not-selected'
    end
  end

  def current_class2?(test_path)
    if request.path == test_path
      return 'bouton-text-nav-active'
    else
      return 'bouton-text-nav'
    end
  end
end
