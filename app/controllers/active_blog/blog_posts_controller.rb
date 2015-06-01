module ActiveBlog
  class BlogPostsController < ApplicationController
    layout ActiveBlog.template_layout

    before_filter :only => [:index, :show, :archives] do
      @recent_blog_posts = BlogPost.live.recent
    end

    def index
      @blog_posts = BlogPost.live.page(params[:page])
    end

    def archives
      @blog_posts = BlogPost.all
    end

    def show
      @blog_post = BlogPost.blog_post(params[:cached_slug])
    end

    # Move into ActiveAdmin responsibility
    def preview
      @active_blog_blog_post = BlogPost.new(post_params)
      @blog_post_partial = render_to_string(:partial => 'active_blog/active_admin/blog_post_show')

      respond_to do |format|
        format.js
      end
    end

    def atom
      @blog_posts = BlogPost.live.limit(10)
      respond_to do |format|
        format.xml
      end
    end

    private

      def post_params
        params.require(:active_blog_blog_post).permit(:title, :body, :draft, :published_at)
      end
  end
end
