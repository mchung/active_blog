module ActiveBlog
  module BlogPostsHelper
    def markdown(text)
      Redcarpet.new(text, :hard_wrap).to_html.html_safe
    end

    def schema_date(date)
      date.strftime("%Y-%m-%d")
    end
  end
end
