# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   
#Add adminstrator user from seed
if User.count == 0
  User.create!(name: "John Doe", email: "admin@hotmail.com", password: "Superuser1234", password_confirmation: "Superuser1234", role: :admin, confirmed_at: Time.current)
end
Category.create(name: "Love")
Category.create(name: "Adventure")
Category.create(name: "Fiction")
Category.create(name: "Comedy")
