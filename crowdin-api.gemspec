require File.expand_path('../lib/crowdin-api/client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'crowdin-api'
  gem.version     = Crowdin::Client::VERSION
  gem.authors     = ['Crowdin']
  gem.email       = ['support@crowdin.net']
  gem.homepage    = 'https://github.com/crowdin/crowdin-api/'
  gem.summary     = 'Client library to manage translations on Crowdin'
  gem.description = 'Ruby Client for the Crowdin API v2'
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'rest-client', '~> 2.0'

  gem.add_development_dependency 'bundler', '~> 1.9'
  gem.add_development_dependency 'rspec', '~> 3.8'
  gem.add_development_dependency 'webmock', '~> 3.6'
  gem.add_development_dependency 'sinatra', '~> 2.0', '>= 2.0.5'
  gem.add_development_dependency 'rake', '~> 11.2', '>= 11.2.2'
end
