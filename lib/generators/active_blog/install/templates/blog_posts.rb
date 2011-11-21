ActiveAdmin.register ActiveBlog::BlogPost do
  form :partial => 'active_blog/active_admin/blog_post_form'
  show :title => :title do
    render 'active_blog/active_admin/show'
  end
end
