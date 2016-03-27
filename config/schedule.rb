set :environment, "development"

every 5.minutes do
  rake "posts:randomize_featured"
end