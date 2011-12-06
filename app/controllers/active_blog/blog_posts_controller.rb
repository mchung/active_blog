module ActiveBlog
  class BlogPostsController < ApplicationController

    before_filter :only => [:index, :show] do
      @recent_blog_posts = BlogPost.live.recent
    end

    def index
      @blog_posts = BlogPost.live.page(params[:page])
    end

    def show
      @blog_post = BlogPost.live.where(:cached_slug => params[:cached_slug]).first
      if @blog_post
        render
      else
        # TODO(mc): Should 404
        redirect_to active_blog_path, :notice => "No blog post with that URL"
      end
    end

    def preview
      @active_blog_blog_post = BlogPost.new(params[:active_blog_blog_post])
      @blog_post = render_to_string(:partial => 'active_blog/active_admin/blog_post_show')

      respond_to do |format|
        format.js
      end
    end

    def feed
      @blog_posts = BlogPost.live.order('published_at DESC').limit(10)
      respond_to do |format|
        format.atom
      end
    end
  end
end
