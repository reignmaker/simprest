json.array!(@users) do |user|
  json.extract! user, :id, :email, :referrer_id, :created_at, :updated_at
  json.tickets user.tickets do |ticket|
    json.id ticket.id
    json.key ticket.key
    json.created_at ticket.created_at
    json.updated_at ticket.updated_at
  end
end