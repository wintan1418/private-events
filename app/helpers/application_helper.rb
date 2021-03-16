module ApplicationHelper

    def logic
        links = ''
        if logged_in?
            links << link_to("Attend", event_attendences_path(event_id: ev.id), method: :post )
            links << ' | '
            links << link_to( "Attend", event_attendences_path(event_id: ev.id), method: :post)
            links << link_to( "Create Event", new_event_path, class: "text-center")
        else
            links << ' | '
            links << link_to("Login", login_path, class: "nav-link")
            links << link_to("Sign Up", new_user_path, class: "nav-link")
        links.html_safe
         end

        end
    end

