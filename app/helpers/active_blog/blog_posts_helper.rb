module ActiveBlog
  module BlogPostsHelper

    def markdown
      @markdown ||= ActiveBlog::Markdown.renderer
    end

    def schema_blog_post(text, length = 250)
      truncate(strip_tags(markdown.render(text)).strip.gsub(/\n/, ' '), :length => length)
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
