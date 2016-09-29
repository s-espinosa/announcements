Fabricator(:slide) do
  title { |i| "Title #{i}" }
  message { |i| "Slide message #{i}" }
  image_url { |i| "https://robohash.org/#{i}" }
end
