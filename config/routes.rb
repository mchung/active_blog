ActiveBlog::Engine.routes.draw do
  match "/" => "blog_posts#index"
end
