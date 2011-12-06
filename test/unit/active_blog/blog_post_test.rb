require 'test_helper'

module ActiveBlog
  class BlogPostTest < ActiveSupport::TestCase
    test "titles may not begin with '-'" do
      bp = BlogPost.new(:title => "-What is the Meaning of Life?")
      bp.save
      assert_equal "cannot start with a dash", bp.errors.messages[:title].first
    end

    test "slugify before create" do
      bp = BlogPost.new(:title => "The title is great")
      bp.save
      assert_equal "the-title-is-great", bp.cached_slug
    end

    test "resaving title does not change title" do
      bp = BlogPost.new(:title => "The title is great")
      bp.save
      assert_equal "the-title-is-great", bp.cached_slug

      bp.title = "Yet another title"
      bp.save
      assert_equal "the-title-is-great", bp.cached_slug
    end

    test "default published_at is now" do
      bp = BlogPost.new
      assert_not_nil bp.published_at
    end

    test "title can't have 'archives' in it" do
      bp = BlogPost.new(:title => 'archives')
      bp.save
      assert_equal "cannot be named 'archives'", bp.errors.messages[:title].first
    end
  end
end
