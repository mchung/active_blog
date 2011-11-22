module ActiveBlog
  module ApplicationHelper
    def blog_title
      ActiveBlog.blog_title
    end

    def blog_sidebar(&block)
      sidebar_content_for = ActiveBlog.blog_content_for_sidebar
      if sidebar_content_for
        content_for sidebar_content_for do
          yield
        end
      end
    end

    def blog_author_name
      ActiveBlog.blog_author_name
    end

    def blog_author_uri
      ActiveBlog.blog_author_uri
    end

    def blog_author_email
      ActiveBlog.blog_author_email
    end

    def blog_atom_link_tag
      auto_discovery_link_tag(:atom, "#{active_blog_feed_url}.atom", {:title => "Subscribe to this blog"})
    end
  end
end
