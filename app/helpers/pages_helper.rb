module PagesHelper

  def user_name(user)
    case user.provider
    when 'twitter'
        "@#{user.name}"
    end
  end

end
