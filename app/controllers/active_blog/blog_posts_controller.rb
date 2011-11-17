module ActiveBlog
  class BlogPostsController < ApplicationController
    def index
      @blog_posts = BlogPost.live.order('published_at DESC')
    end
  
    def show
      @blog_post = BlogPost.live.where(:cached_slug => params[:cached_slug]).first
    end
  end
end
