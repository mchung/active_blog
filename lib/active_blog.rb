require 'active_blog/engine'
require 'active_blog/mapper'
require 'redcarpet'

module ActiveBlog

  # The blog's title
  mattr_accessor :blog_title
  @@blog_title = 'New ActiveBlog!'

  def self.setup
    yield self
  end
end
