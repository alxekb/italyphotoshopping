# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.find_by(email: '01@test.com').nil?
  user = User.create!(email: '01@test.com', password: 123_123_123)
  profile = user.profile.build!(name: 'Alex')
end

# 20.times do
#   Item.create(
#
#   )
# end
BatchStatus.create!(status: 'Собираем') if BatchStatus.find_by(status: 'Собираем').nil?
BatchStatus.create!(status: 'Отправляем') if BatchStatus.find_by(status: 'Отправляем').nil?
BatchStatus.create!(status: 'Отправили') if BatchStatus.find_by(status: 'Отправили').nil?
