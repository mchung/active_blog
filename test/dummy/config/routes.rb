Rails.application.routes.draw do

  mount ActiveBlog::Engine => "/active_blog"
end
