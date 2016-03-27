set :environment, "development"

every 1.minute do
  rake "posts:randomize_featured"
end