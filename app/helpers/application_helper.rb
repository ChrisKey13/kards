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

  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end
end
