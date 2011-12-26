module ActiveBlog
  # These helpers are intended to be used by developers.
  #
  #
  module ApplicationHelper
    def active_blog_title
      ActiveBlog.title
    end

    def active_blog_description
      ActiveBlog.description
    end

    def active_blog_sidebar(&block)
      sidebar_content_for = ActiveBlog.content_for_sidebar
      if sidebar_content_for
        content_for sidebar_content_for do
          yield
        end
      end
    end

    def active_blog_author_name
      ActiveBlog.author_name
    end

    def active_blog_author_uri
      ActiveBlog.author_uri
    end

    def active_blog_author_email
      ActiveBlog.author_email
    end

    def active_blog_atom_link_tag
      auto_discovery_link_tag(:atom, "#{active_blog_feed_url}", {:title => "Subscribe to this blog"})
    end
  end
end
