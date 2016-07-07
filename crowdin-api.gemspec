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

  gem.add_runtime_dependency 'rest-client', '~> 1.8'

  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'webmock', '~> 2.1'
  gem.add_development_dependency 'sinatra', '~> 1.4', '>= 1.4.7'
  gem.add_development_dependency 'bundler', '~> 1.9'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'pry', '~> 0.10.3'
end
