$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alchemy/demo_kit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alchemy-demo_kit"
  s.version     = Alchemy::DemoKit::VERSION
  s.authors     = ["Thomas von Deyen"]
  s.email       = ["alchemy@magiclabs.de"]
  s.homepage    = "http://alchemy-cms.com"
  s.summary     = "Alchemy CMS demo kit."
  s.description = "A collection of elements and page layouts that form the Alchemy CMS demo website from http://demo.alchemy-cms.com"

  s.files = Dir["{app,config,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.post_install_message  = <<-POST_INSTALL

 Please don't forget to run:

  $ bundle exec rails g alchemy:demo_kit

POST_INSTALL

  s.add_dependency "alchemy_cms", '~> ' + Alchemy::DemoKit::VERSION
end
