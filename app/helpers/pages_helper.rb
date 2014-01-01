module PagesHelper

  def user_name(user)
    case user.provider
    when 'twitter'
      "@#{user.name}"
    when 'facebook'
      "#{user.name}"
    when 'google_oauth2'
      "#{user.name}"
    end
  end

end
