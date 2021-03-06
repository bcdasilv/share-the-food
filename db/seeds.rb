# frozen_string_literal: true

require 'time'

def seed_users
  user_id = 0
  names1 = %w[Sally Bob Fhen Milton Rick]
  names2 = %w[Sue Bobson Do Milston Sanchez]

  10.times do
    name1 = names1[rand(names1.length)]
    User.create(
      name: name1 + (names2[rand(names2.length)]).to_s,
      display_name: name1,
      email: "email#{user_id}@email.com", password: '123456',
      password_confirmation: '123456',
      admin: false
    )
    user_id += 1
  end
end

# rubocop:disable Metrics/AbcSize
def seed_donations
  names = ['Pasta', 'Pizza', 'Canned Beans', 'Ramen']
  times = [
    Time.new(2000, 6, 15),
    Time.new(2019, 12, 31),
    Time.new(2022, 1, 0o5)
  ]

  100.times do
    n = names[rand(names.length)]

    Donation.create(
      user_id: rand(10), name: n,
      description: "This is a delicious #{n}!",
      fresh_until: times[rand(times.length)], latitude: rand(-85..84),
      longitude: rand(-180..179),
      pickup_notes: 'Meet me at these coordinates. Bring a bag.',
      is_perishable: true, requires_preparation: false,
      is_vegetarian: rand(2).even?, is_vegan: rand(2).even?,
      is_gluten_free: rand(2).even?, contains_peanut: rand(2).even?,
      contains_treenut: rand(2).even?, contains_dairy: rand(2).even?,
      contains_soy: rand(2).even?, contains_egg: rand(2).even?,
      contains_fish: rand(2).even?, contains_shellfish: rand(2).even?
    )
  end
  # rubocop:enable Metrics/AbcSize
end

seed_users
seed_donations
