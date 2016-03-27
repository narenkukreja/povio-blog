namespace :posts do
  task :randomize_featured => :environment do
    Post.where(is_featured: true).update_all(is_featured: false)
    Post.offset(rand(Post.count)).first.update_attribute(:is_featured, true)
    Post.save
  end
end
