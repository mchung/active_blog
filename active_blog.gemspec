$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_blog"
  s.version     = ActiveBlog::VERSION
  s.authors     = ["Marc Chung"]
  s.email       = ["mchung@gmail.com"]
  s.homepage    = "http://github.com/mchung/active_blog"
  s.summary     = "A barebones, markdown, blogging Rails Engine."
  s.description = "ActiveBlog is a Rails Engine for Blogging"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "activeadmin", '~> 1.0.0.pre1'
  s.add_dependency "redcarpet", "~> 3.2.3"
  s.add_dependency "kaminari", "~> 0.16.3"

  s.add_development_dependency "pg"
end
