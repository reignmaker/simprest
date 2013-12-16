json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :user_id, :key
  json.url ticket_url(ticket, format: :json)
end
