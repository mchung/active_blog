module ActiveBlog
  class BlogPost < ActiveRecord::Base
    self.table_name = 'active_blog_blog_posts'
    paginates_per ActiveBlog.paginates_per
    default_scope :order => 'published_at DESC'

    scope :live, where('published_at < ? AND draft = ?', Time.zone.now, false)
    scope :recent, limit(5)

    validates_presence_of :title, :allow_blank => false, :allow_nil => false, :message => "can't be blank"
    validates_presence_of :body, :allow_blank => false, :allow_nil => false, :message => "can't be blank"
    validates_presence_of :cached_slug, :allow_blank => false, :allow_nil => false, :message => "can't be blank"
    validates_uniqueness_of :cached_slug, :message => "must be unique"
    validate :title_must_not_start_with_dash
    validate :title_must_not_be
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

    def title_must_not_be
      errors.add(:title, "cannot be named 'archives'") if title == 'archives'
    end

    def init
      # Set now as the default published_at date. Only set if currently nil
      self.published_at ||= Time.zone.now
    end
  end
end
