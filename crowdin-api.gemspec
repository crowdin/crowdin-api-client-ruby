# encoding: utf-8

require File.expand_path('../lib/crowdin-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'crowdin-api'
  gem.version       = Crowdin::API::VERSION

  gem.authors       = ['Crowdin']
  gem.email         = ['support@crowdin.net']
  gem.homepage      = 'https://github.com/crowdin/crowdin-api/'
  gem.description   = 'Ruby Client for the Crowdin API'
  gem.summary       = 'Client library to manage translations on Crowdin'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rest-client', '>= 1.6.7'
end
