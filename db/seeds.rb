# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Random.new()

50.times do |i| 

  user = User.create(:email => "user-#{i}@mail.com")
  r.rand(1..10).times do |j|
    user.tickets.create
  end

end

User.find_each do |user|
  referrer_id = r.rand(1..49)
  user.referrer_id = user.referrer_id == referrer_id ? referrer_id + 1 : referrer_id
  user.save(:validate => false)
end