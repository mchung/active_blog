require 'active_blog/engine'
require 'active_blog/mapper'
require 'redcarpet'
require 'active_blog/ext/string'

module ActiveBlog

  # The blog's title
  mattr_accessor :blog_title
  @@blog_title = 'New ActiveBlog!'

  # Yield to your layout's sidebar, i.e. :sidebar
  mattr_accessor :blog_content_for_sidebar
  @@blog_content_for_sidebar = nil

  # Blog author's name
  mattr_accessor :blog_author_name
  @@blog_author_name = nil

  # Blog author's uri
  mattr_accessor :blog_author_uri
  @@blog_author_uri = nil

  # Blog author's email
  mattr_accessor :blog_author_email
  @@blog_author_email = nil

  def self.setup
    yield self
  end
end
