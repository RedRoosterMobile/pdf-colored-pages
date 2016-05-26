# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdf_colored_pages/version'

Gem::Specification.new do |spec|
  spec.name        = 'pdf_colored_pages'
  spec.version     = PdfColoredPages::VERSION
  spec.authors     = ['Thomas Ranker']
  spec.email       = ['info@redroostermobile.com']
  spec.homepage    = 'https://github.com/RedRoosterMobile/pdf-colored-pages'
  spec.summary     = 'Get the colored pages of a pdf'
  spec.description = 'Gets the colored pages of a PDF by parsing Ghostscript (>9.05) output'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = ['pdf_colored_pages']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
