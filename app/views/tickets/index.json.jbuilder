json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :user_id, :key
  json.url user_ticket_url(ticket.user, ticket, format: :json)
end
