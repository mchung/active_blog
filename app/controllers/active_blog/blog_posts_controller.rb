module ActiveBlog
  class BlogPostsController < ApplicationController
    def index
      @blog_posts = BlogPost.all
    end
  
    def show
    end
  
  end
end
