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

  def icon s
    content_tag :i, nil, class: "fa fa-#{s}"
  end
end
