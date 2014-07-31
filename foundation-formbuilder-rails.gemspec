# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundation/form_builder/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "foundation-formbuilder-rails"
  spec.version       = Foundation::FormBuilder::Rails::VERSION
  spec.authors       = ["Ashley Bye"]
  spec.email         = ["ashley.bye85@gmail.com"]
  spec.description   = %q{FormBuilder for the ZURB Foundation 5 CSS Framework}
  spec.summary       = %q{FormBuilder for the ZURB Foundation 5 CSS Framework}
  spec.homepage      = "https://github.com/ashleybye/foundation-formbuilder-rails"
  spec.license       = "MIT"

  spec.files         = Dir["README.md", "lib/**/*"]
  spec.test_files    = Dir["test/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_dependency "foundation-rails", "~> 5.3", ">= 5.3.0.1"
end