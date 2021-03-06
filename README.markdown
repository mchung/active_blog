# ActiveBlog is a work in progress.

ActiveBlog is Rails engine written to satisfy *minimal* blogging requirements. 

The ActiveBlog BlogPost model:

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

ActiveBlog has the following dependencies: 

* ActiveAdmin, for the backend
* Devise, for admin authentication
* Redcarpet, for markdown rendering
* PostgreSQL, for storage

# How to install ActiveBlog

Add the following line to your Gemfile

    gem 'active_blog'

Run Bundler

    bundle update --source active_blog

Run the generator

    ./script/rails generate active_blog:install

[Follow the installer's directions](https://github.com/mchung/active_blog/blob/master/lib/generators/active_blog/install/templates/README)

Install the migrations

    rake db:migrate

Start your server with `foreman` or `rails s` and visit your new blog located at:

    http://localhost:5000/blog

To create a new blog post, visit the admin area located at:

    http://localhost:5000/admin/blog_posts

# How to hack on ActiveBlog

Setup the development and test databases

    rake app:db:setup
    rake app:db:test:clone

Running tests

    rake test

# TODO

* The ActiveAdmin BlogPost form should allow users to upload content to S3
* Document Parent App Hooks (content_for :sidebar, content_for :title, content_for: head)
* Missing ActiveAdmin UI tests.