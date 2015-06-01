ActiveAdmin.register ActiveBlog::BlogPost do
  form :partial => 'active_blog/active_admin/blog_post_form'
  show :title => :title do
    render 'active_blog/active_admin/show'
  end
  permit_params :title, :body, :draft, :published_at
end
