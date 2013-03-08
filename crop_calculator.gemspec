# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crop_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "crop_calculator"
  spec.version       = CropCalculator::VERSION
  spec.authors       = ["Deepak Kumar"]
  spec.email         = ["deepak@kreatio.com"]
  spec.description   = %q{Calculate Crop rectangle based on ROI within an image}
  spec.summary       = %q{Calculate Crop rectangle based on ROI within an image}
  spec.homepage      = "https://github.com/kreatio-sw/crop_calculator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
