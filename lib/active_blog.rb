require 'active_blog/engine'
require 'active_blog/mapper'

module ActiveBlog
  def self.setup
    yield self
  end
end
