module ActiveBlog
  module BlogPostsHelper
    def markdown(text)
      Redcarpet.new(text, :hard_wrap).to_html.html_safe
    end
  end
end
