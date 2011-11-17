class CreateActiveBlogBlogPosts < ActiveRecord::Migration
  def change
    create_table :active_blog_blog_posts do |t|
      t.string :title
      t.string :body
      t.boolean :draft
      t.datetime :published_at
      t.string :cached_slug
      t.string :custom_url

      t.timestamps
    end
  end
end
