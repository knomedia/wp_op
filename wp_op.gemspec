# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wp_op/version'

Gem::Specification.new do |spec|
  spec.name          = "wp_op"
  spec.version       = WpOp::VERSION
  spec.authors       = ["jsk"]
  spec.email         = ["knomedia@gmail.com"]
  spec.description   = %q{Convert exported wordpress articles to Octopress}
  spec.summary       = %q{Convert exported wordpress articles to Octopress}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "~>1.6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
