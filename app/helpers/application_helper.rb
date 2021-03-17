module ApplicationHelper
  def alert_notice
    links = ' '
    links << link_to(link_to(notice)) if notice
  end

  def notice_alert
    links = ' '
    links << link_to(link_to(alert)) if alert
  end

  def nav_links
    links = ' '
    if logged_in?
      links << link_to(link_to('MyEvents', user_path(current_user.id), class: 'nav-link'))
      links << link_to(link_to('Log Out', logout_path, method: :delete, class: 'nav-link'))

    else
      links << link_to(link_to('Login', login_path, class: 'nav-link'))
      links << link_to(link_to('Sign Up', new_user_path, class: 'nav-link'))

    end
    links.html_safe
  end

  def logic
    links = ''
    if logged_in?
      links << link_to(link_to('event', event_attendences_path[:event_id], method: :post))
      links << link_to(link_to('Create Event ', new_event_path, class: 'text-center'))

    end
    links.html_safe
  end
end
