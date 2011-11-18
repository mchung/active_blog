module ActiveBlog
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      desc 'Installs ActiveBlog'
      def copy_initializer
        template 'active_blog.rb', 'config/initializers/active_blog.rb'
      end

      def setup_directory
        empty_directory 'app/admin'
        template 'blog_posts.rb', 'app/admin/blog_posts.rb'
      end

      def setup_routes
        route "active_blog_at '/blog'"
      end

      def rake_copy_migrations
        rake('active_blog_engine:install:migrations')
      end

      def show_readme
        readme("README")
      end
    end
  end
end