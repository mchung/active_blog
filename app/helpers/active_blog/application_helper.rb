module ActiveBlog
  module ApplicationHelper
    def markdown(text)
      Redcarpet.new(text, :hard_wrap).to_html.html_safe
    end
  end
end
