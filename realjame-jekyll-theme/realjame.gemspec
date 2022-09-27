# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "realjame"
  spec.version       = "0.1.5"
  spec.authors       = ["James"]
  spec.email         = ["james@realja.me"]

  spec.summary       = "A theme for Jekyll that imitates the look of my website, realja.me. Made for personal use."
  spec.homepage      = "https://realja.me/blog"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files         = Dir["assets/**/*.*", "_layouts/**/*.*", "_includes/**/*.*", "_sass/**/*.*", "LICENSE", "README.md"]#, "_config.yml"]

  spec.add_runtime_dependency "jekyll", "~> 4.2"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"

  spec.add_development_dependency "bundler" 
end
