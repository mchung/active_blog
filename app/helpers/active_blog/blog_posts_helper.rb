module ActiveBlog
  module BlogPostsHelper
    def markdown(text)
      regular = { :hard_wrap => true, :autolink => true, :space_after_headers => true }
      make_markdown(regular).render(text).html_safe
    end

    def markdown_for_schema(text)
      truncate(strip_tags(markdown(text)).strip.gsub(/\n/, ' '), :length => 250)
    end

    def make_markdown(opts)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, opts)
      markdown
    end

    def schema_date(date)
      date.strftime("%Y-%m-%d")
    end

    def schema_span_for(name, content)
      content_tag(:span, "", :itemprop => name, :content => content)
    end

    def blog_post_path_for(blog_post)
      if blog_post.new_record?
        admin_active_blog_blog_posts_path(blog_post)
      else
        admin_active_blog_blog_post_path(blog_post)
      end
    end
  end
end
