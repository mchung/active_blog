require 'test_helper'

module ActiveBlog
  class RoutingTest < ActionController::TestCase
    # Tests the following routes:
    #
    #         active_blog          /blog(.:format)
    # active_blog_preview POST|PUT /blog/-/preview(.:format)    {:controller=>"active_blog/blog_posts", :action=>"preview"}
    #    active_blog_feed GET      /blog/-/feed(.:format)       {:controller=>"active_blog/blog_posts", :action=>"feed"}
    #    active_blog_post          /blog/:cached_slug(.:format) {:controller=>"active_blog/blog_posts", :action=>"show"}

    test "should route /blog" do
      assert_routing '/blog', {:controller=>"active_blog/blog_posts", :action=>"index"}
    end
    test "should route /blog/-/preview" do
      assert_routing({:path => '/blog/-/preview', :method => :post}, {:controller=>"active_blog/blog_posts", :action=>"preview"})
    end
    test "should route /blog/atom.xml" do
      assert_routing '/blog/atom.xml', {:controller=>"active_blog/blog_posts", :action=>"atom",:format=>:xml}
    end
    test "should route /blog/:cached_slug" do
      assert_routing '/blog/my-blog-post-title', {:controller=>"active_blog/blog_posts", :action=>"show", :cached_slug=>"my-blog-post-title"}
    end
  end
end
