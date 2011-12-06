module ActionDispatch::Routing
  class Mapper
    def active_blog_at(mount_location)
      # Engine routes are created here
      #
      #
      scope mount_location do
        resources :blog_posts, :module => 'active_blog', :path => '/', :only => [] do
          get 'page/:page', :action => :index, :on => :collection
          # match '/', :action => :index, :on => :collection, :as => :all
          # match '/-/preview', :action => :preview, :on => :collection, :as => :preview, :via => [:post, :put]
          # match '/-/feed', :action => :feed, :on => :collection, :as => :feed, :via => [:get]
          # match '/:cached_slug', :action => :show, :on => :collection, :as => :post, :via => [:get]
        end
        match '/' => 'active_blog/blog_posts#index', :as => :active_blog, :via => [:get]
        match '/-/preview' => 'active_blog/blog_posts#preview', :as => :active_blog_preview, :via => [:post, :put]
        match '/-/feed' => 'active_blog/blog_posts#feed', :as => :active_blog_feed, :via => [:get]
        match '/archives' => 'active_blog/blog_posts#archives', :as => :active_blog_archives, :via => [:get]
        # Always last.
        match '/:cached_slug' => 'active_blog/blog_posts#show', :as => :active_blog_post, :via => [:get]
      end
    end
  end
end
