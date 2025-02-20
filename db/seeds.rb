# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.create(email: 'camilo@gmail.com', name: 'Camilo', password: '123456', password_confirmation: '123456')
user2 = User.create(email: 'lorena@gmail.com', name: 'Lorena', password: '123456', password_confirmation: '123456')

5.times do |x|
  Post.create(title: "Title #{x + 1}", body: "Body #{x + 1}", user_id: user1.id)
end

5.times do |x|
  Post.create(title: "Title #{x + 1}", body: "Body #{x + 1}", user_id: user2.id)
end