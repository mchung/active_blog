require 'test_helper'
require 'pp'

class SampleRenderer < Redcarpet::Render::HTML
  def preprocess(fulldoc)
    # pp [:fulldoc, fulldoc]
    fulldoc
  end
  def entity(text)
    # pp [:text, text]
    text
  end
end

module ActiveBlog
  class SampleRendererTest < ActiveSupport::TestCase
    test "rendering" do
      markdown = Redcarpet::Markdown.new(SampleRenderer)
      assert_equal("<p>This is <em>bongos</em>, indeed.</p>\n", markdown.render("This is *bongos*, indeed."))
    end
  end
end
