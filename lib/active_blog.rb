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

  def self.setup
    yield self
  end
end
