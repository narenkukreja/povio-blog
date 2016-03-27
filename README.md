# Povio Blog using Ruby on Rails (Naren Kukreja)

### Authentication System (Devise Gem)

Authentication feature was added using the [Devise Gem](https://github.com/plataformatec/devise) along with custom modifications as per assignment instructions.
### Featured Post (Whenever Gem)

Featured Post background worker utilized the [Whenever Gem](https://github.com/javan/whenever) to deploy cron jobs.

Background Worker task located at `lib/tasks/posts.rake` with the following code:

```ruby
namespace :posts do
  task :randomize_featured => :environment do
    Post.where(is_featured: true).update_all(is_featured: false)
    Post.offset(rand(Post.count)).first.update_attribute(:is_featured, true)
    Post.save
  end
end
```

The scheduler file is located at `config/schedule.rb` with the following code:

```ruby
set :environment, "development"

every 5.minutes do
  rake "posts:randomize_featured"
end
```

### JSON/XML Post Formats

JSON/XML post formats for the index page can be accessed by visiting `http://localhost:3000/posts.json?` or
`http://localhost:3000/posts.xml?`

Additionally each post contains links to view the post in JSON or XML formats.

![alt text](https://github.com/narenkukreja/povio-blog/blob/master/app/assets/images/json_xml.png)

### Frontend

Utilized Bootstrap along with SASS for the frontend.

### Image Previews

![alt text](https://github.com/narenkukreja/povio-blog/blob/master/app/assets/images/main.png)
![alt text](https://github.com/narenkukreja/povio-blog/blob/master/app/assets/images/show.png)
![alt text](https://github.com/narenkukreja/povio-blog/blob/master/app/assets/images/edit.png)
![alt text](https://github.com/narenkukreja/povio-blog/blob/master/app/assets/images/login.png)



