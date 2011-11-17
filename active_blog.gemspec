$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_blog"
  s.version     = ActiveBlog::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActiveBlog."
  s.description = "TODO: Description of ActiveBlog."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "redcarpet"

  s.add_development_dependency "sqlite3"
end
