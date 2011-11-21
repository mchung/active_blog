module ActionDispatch::Routing
  class Mapper
    def active_blog_at(mount_location)
      # Engine routes are created here
      #
      #
      scope mount_location do
        match '/' => 'active_blog/blog_posts#index', :as => :active_blog
        match '/_preview' => 'active_blog/blog_posts#_preview', :as => :active_blog_preview, :via => :post
        match '/:cached_slug' => 'active_blog/blog_posts#show', :as => :active_blog_post
      end
    end
  end
end
