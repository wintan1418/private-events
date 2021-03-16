module ApplicationHelper
    def layout_logic
        <%= render "shared/navb" %>
        <% if notice %>
          <%= notice %>
        <% end %>
        <% if alert %>
          <%= alert %>
        <% end %>
        <%= yield %>
    end
end
