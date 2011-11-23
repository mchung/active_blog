atom_feed({}) do |feed|
  feed.title(blog_title)
  feed.updated(@blog_posts[0].published_at) if @blog_posts.length > 0

  @blog_posts.each do |post|
    feed.entry(post, {
      :published_at => post.published_at,
      :updated_at => post.updated_at,
      :url => active_blog_post_url(post.cached_slug)
    }) do |entry|
      entry.title(post.title)
      entry.content(markdown(post.body), :type => 'html')

      entry.author do |author|
        author.name(blog_author_name) if blog_author_name
        author.uri(blog_author_uri) if blog_author_uri
        author.email(blog_author_email) if blog_author_email
      end
    end
  end
end