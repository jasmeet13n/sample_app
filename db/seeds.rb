User.create!(name:  "Administrator",
             email: "admin@example.com",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Jasmeet Singh",
             email: "jasmeet13n@tamu.edu",
             password:              "iiit123",
             password_confirmation: "iiit123",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  users.each { |user| user.microposts.create!(content: Faker::Lorem.sentence(5)) }
end

# Following relationships
users = User.all
user  = users.second
following = users[3..50]
followers = users[4..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
