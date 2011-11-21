module ActiveBlog
  class BlogPost < ActiveRecord::Base
    set_table_name 'active_blog_blog_posts'

    scope :live, where('published_at < ? AND draft = ?', Time.now, false)
    scope :recent, limit(5)

    validates_presence_of :cached_slug, :on => :create, :message => "can't be blank"
    validate :title_must_not_start_with_dash
    before_validation :build_cached_slug
    after_initialize :init

    # protected methods

    def build_cached_slug
      # Don't build slug if it already exists.
      if self.cached_slug.nil?
        self.cached_slug = title.to_slug
      end
    end

    def title_must_not_start_with_dash
      if title.starts_with?('-')
        errors.add(:title, 'cannot start with a dash')
      end
    end

    def init
      # Set now as the default published_at date. Only set if currently nil
      self.published_at ||= Time.zone.now
    end
  end
end
