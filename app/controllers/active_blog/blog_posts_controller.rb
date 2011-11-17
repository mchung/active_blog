module ActiveBlog
  class BlogPostsController < ApplicationController
    def index
      @blog_posts = BlogPost.all
      # render :layout => "application"
    end
  
    def show
    end
  
  end
end
