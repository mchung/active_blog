module ActionDispatch::Routing
  class Mapper
    def active_blog_at(mount_location)
      # Engine routes are created here
      #
      #
      scope mount_location do
        match '/' => 'active_blog/blog_posts#index', :as => :active_blog
        match '/-/preview' => 'active_blog/blog_posts#preview', :as => :active_blog_preview, :via => [:post, :put]
        match '/-/feed' => 'active_blog/blog_posts#feed', :as => :active_blog_feed, :via => :get
        match '/:cached_slug' => 'active_blog/blog_posts#show', :as => :active_blog_post
      end
    end
  end
end
