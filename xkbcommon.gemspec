# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xkbcommon/version'

Gem::Specification.new do |spec|
  spec.name          = "xkbcommon"
  spec.version       = Xkbcommon::VERSION
  spec.authors       = ["Christopher Aue"]
  spec.email         = ["mail@christopheraue.net"]

  spec.summary       = %q{1:1 ruby bindings for libxkbcommon}
  spec.homepage      = "https//github.com/christopheraue/ruby-xkbcommon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ffi', '~> 1.9'
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "ffi-swig-generator", '~> 0'
end
