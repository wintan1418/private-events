module ApplicationHelper

    def alert_notice
        links = ' '
        if notice
        links << link_to(link_to  notice)  
        end  
    end
    def notice_alert
        links = ' '
        if alert
        links << link_to(link_to  alert)  
        end  
    end

    def nav_links
        links = ' '
        if logged_in?
            links << link_to(link_to "MyEvents", user_path(current_user.id), class: "nav-link")
            links << link_to(link_to "Log Out", logout_path, method: :delete, class: "nav-link")

        else
            links << link_to(link_to "Login", login_path, class: "nav-link")
            links << link_to(link_to "Sign Up", new_user_path, class: "nav-link")

        end
         links.html_safe
    end

   

    def logic
        links = ''
        if logged_in?
            links << link_to("Attend", event_attendences_path(event_id: ev.id), method: :post )
            links << ' | '
            links << link_to( "Create Event", new_event_path, class: "text-center")
        end
        links.html_safe
        end
    end

