Fabricator(:slide) do
  title { Faker::Lorem.sentence }
  message { Faker::Lorem.sentence }
  image_url { "https://robohash.org/#{rand(100)}" }
end
