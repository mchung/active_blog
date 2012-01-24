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

  s.add_dependency "rails", ">= 3.1.1"
  s.add_dependency "redcarpet", "~> 2.0.0b5"
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
end
