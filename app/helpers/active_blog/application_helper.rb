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
  end
end
