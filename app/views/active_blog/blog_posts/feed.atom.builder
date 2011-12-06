atom_feed({}) do |feed|
  feed.title(active_blog_title)
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
        author.name(active_blog_author_name) if active_blog_author_name
        author.uri(active_blog_author_uri) if active_blog_author_uri
        author.email(active_blog_author_email) if active_blog_author_email
      end
    end
  end
end