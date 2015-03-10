require File.expand_path('../lib/crowdin-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'crowdin-api'
  gem.version = Crowdin::API::VERSION
  gem.license = 'MIT'
  gem.summary = 'Client library to manage translations on Crowdin'
  gem.description = 'Ruby Client for the Crowdin API'

  gem.authors = ['Crowdin']
  gem.email = ['support@crowdin.net']
  gem.homepage = 'https://github.com/crowdin/crowdin-api/'

  gem.files = Dir[
    'README.md', 'LICENSE',
    'lib/**/*.rb'
  ]
  gem.require_paths = ['lib']
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.extra_rdoc_files = ["README.md", "LICENSE"]

  gem.add_dependency 'rest-client', '~> 1.6.8'
  gem.add_development_dependency 'rspec', '~> 0'
end
