class CreateActiveBlogBlogPosts < ActiveRecord::Migration
  def change
    create_table :active_blog_blog_posts do |t|
      t.string :title
      t.string :body
      t.boolean :draft
      t.datetime :published_at
      t.string :cached_slug
      t.string :custom_url
      t.integer :user_id

      t.timestamps
    end
    add_index :active_blog_blog_posts, :id
  end
end
