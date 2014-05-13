module GoalsHelper

  def dist_diff(t, c)
    out = "<h2 class='" + ((c > t) ? 'positive' : 'negative') + "'>"
    out += f2(c - t, true)
    out += "</h2>"
    out += "#{f2(t)} / #{f2(c)}"
    out += "<br/>"
    out += (t <= 0.0) ? '0.0%' : ' ' + f2(100 * c / t) + "%"
    out.html_safe
  end

  def f2(x, sign=false)
    if sign then '%+.2f' % x else '%.2f' % x end
  end

  def tweet_your_goal_button(goal)
    link_to "Tweet your goal!", "https://twitter.com/share", class: 'twitter-share-button', 
      data: { size: 'large', url: "http://thisyeari.com", text: goal.description,
              hashtags: 'thisyeari', count: 'none' }
  end
end
