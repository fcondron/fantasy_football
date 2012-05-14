module UsersHelper

  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.username),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def deny_access
    redirect_to signin_path, :alert => "Please sign in to access this page."
  end

end