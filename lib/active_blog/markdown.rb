require 'redcarpet'

module ActiveBlog
  class Markdown
    attr_reader :markdown

    def initialize
      options = {
        hard_wrap:                    true,
        space_after_headers:          true
      }

      extensions = {
        autolink:                     true,
      }

      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    def render(markdown_syntax)
      markdown.render(markdown_syntax).html_safe
    end

    def self.renderer
      ActiveBlog::Markdown.new
    end
  end
end
