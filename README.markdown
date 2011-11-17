# ActiveBlog

ActiveBlog is mountable Rails engine.

ActiveBlog was written to satisfy simple blogging functionality. Here is the
ActiveBlog BlogPost model:

    create_table :blog_posts do |t|
      t.string :title
      t.string :body
      t.boolean :draft
      t.datetime :published_at
      t.string :cached_slug
      t.string :custom_url

      t.timestamps
    end

It is by no means a full blogging engine. There are no categories, no comments,
and certainly no tagging. 

ActiveBlog has two major dependencies: ActiveAdmin and Devise.

The backend dashboard for ActiveBlog ships as an ActiveAdmin resource. The 
authentication system depends on Devise.

# Motivation

ActiveBlog is intended to solve minimal blogging requirements. 

I built ActiveBlog because I had several projects which required simple blogging
functionality. I didn't want to build an authentication system and I didn't want
to have to cobble together yet another blogging backend. 

I didn't want to have to rebuild the same model and RSS logic over and over again
throughout my projects.

# How to install ActiveBlog

Add the following line to your Gemfile

    gem 'active_blog'

Run Bundler

  bundle update active_blog

# How to configure ActiveBlog

Run the generator. This modifies routes.rb and installs an initializer.

  ./script/rails generate active_blog:install

Install the migrations

  rake active_blog:install:migrations

Install the migations

    rake db:migrate

Start your server with `foreman` or `rails s` and visit your new blog located at:

    http://localhost:5000/blog

To create a new blog post, visit the admin area located at:

    http://localhost:5000/admin/blogs
