module EventsHelper

 def event_index
  <ul>
        <% @upcoming_events.each do |ev| %>
        <li><%= ev.description %><br><%= ev.date %></li><%= link_to "View", event_path(id: ev.id) %><br>
        <% if logged_in? %>
            <%= link_to "Attend", event_attendences_path(event_id: ev.id), method: :post %>
        <% end %>
        <% end %>
    </ul>
    <h2>Here is a list of past events:</h2>
    <ul>
            <% @past_events.each do |ev| %>
            <li><%= ev.description %><br><%= ev.date %></li><%= link_to "View", event_path(id: ev.id) %><br>
            <% if logged_in? %>
                <%= link_to "Attend", event_attendences_path(event_id: ev.id), method: :post %>
            <% end %>
            <% end %>
    </ul>
    <% if logged_in? %>
    <%= link_to "Create Event", new_event_path, class: "text-center" %> 

end

end
