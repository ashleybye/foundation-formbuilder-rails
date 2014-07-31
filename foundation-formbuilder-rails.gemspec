# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundation/form_builder/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "foundation-formbuilder-rails"
  spec.version       = Foundation::FormBuilder::Rails::VERSION
  spec.authors       = ["Ashley Bye"]
  spec.email         = ["ashley.bye85@gmail.com"]
  spec.summary       = %q{FormBuilder for the ZURB Foundation 5 CSS Framework}
  spec.description   = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  spec.homepage      = "https://github.com/ashleybye/foundation-formbuilder-rails"
  spec.license       = "MIT"

  spec.files         = Dir["README.md", "lib/**/*"]
  spec.test_files    = Dir["test/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1.2"
  spec.add_development_dependency "bundler", "~> 1.6"
end