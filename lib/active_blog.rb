require 'active_blog/engine'
require 'active_blog/mapper'
require 'active_blog/markdown'
require 'active_blog/ext/string'

module ActiveBlog

  # The blog's title
  mattr_accessor :title
  @@title = 'New ActiveBlog!'

  # The blog's description
  mattr_accessor :description
  @@description = "Here's where your description goes"

  # Yield to your layout's sidebar, i.e. :sidebar
  mattr_accessor :content_for_sidebar
  @@content_for_sidebar = nil

  # Blog author's name
  mattr_accessor :author_name
  @@author_name = nil

  # Blog author's uri
  mattr_accessor :author_uri
  @@author_uri = nil

  # Blog author's email
  mattr_accessor :author_email
  @@author_email = nil

  # Blog posts per page
  mattr_accessor :paginates_per
  @@paginates_per = 10

  # Blog Rails template
  mattr_accessor :template_layout
  @@template_layout = "layouts/application"

  def self.setup
    yield self
  end
end
