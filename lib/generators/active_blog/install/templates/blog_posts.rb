ActiveAdmin.register ActiveBlog::BlogPost do
  form do |f|
    f.inputs "New Blog" do
      f.input :title
      f.input :body, :as => :text
      f.input :draft, :as => :boolean
      f.input :published_at, :label => "Publish post at"
    end
    f.buttons
  end
end
