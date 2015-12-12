# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'correios_sigep/version'

Gem::Specification.new do |spec|
  spec.name          = 'correios_sigep'
  spec.version       = CorreiosSigep::VERSION
  spec.authors       = ['Carlos Ribeiro', 'Felipe Gentil']
  spec.email         = ['duduribeiro.gba@gmail.com', 'mail@carlosribeiro.me', 'cdigentil@gmail.com']
  spec.summary       = 'A gem that integrates with Correios SIGEP WEB.'
  spec.description   = 'An integration with Correios SIGEP WEB system (http://www.correios.com.br/para-sua-empresa/encomendas/sigep-web)'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'net-http-persistent', '~> 2.9.4'
  spec.add_dependency 'savon', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'webmock', '~> 1.0'
end
