module ActiveBlog
  class BlogPostsController < ApplicationController

    # TODO(mc): How can I avoid this additional look up?
    before_filter do
      @recent_blog_posts = BlogPost.live.order('published_at DESC').recent
    end

    def index
      @blog_posts = BlogPost.live.order('published_at DESC')
    end
  
    def show
      @blog_post = BlogPost.live.where(:cached_slug => params[:cached_slug]).first
    end
  end
end
