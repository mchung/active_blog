module ActiveBlog
  class BlogPostsController < ApplicationController
    def index
      @blog_posts = BlogPost.all
    end
  
    def show
      @blog_post = BlogPost.where(:cached_slug => params[:cached_slug]).first
    end
  
  end
end
