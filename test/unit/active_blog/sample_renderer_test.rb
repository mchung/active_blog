require 'test_helper'
require 'pp'

class SampleRenderer < Redcarpet::Render::HTML
  def preprocess(fulldoc)
    pp [:fulldoc, fulldoc]
    fulldoc
  end
  def entity(text)
    pp [:text, text]
    text
  end
end

module ActiveBlog
  class SampleRendererTest < ActiveSupport::TestCase
    test "segfault" do
      markdown = Redcarpet::Markdown.new(SampleRenderer)
      puts markdown.render("This is *bongos*, indeed. <script src='http://haikuist.com/haiku/300.js'></script>")
    end
  end
end
