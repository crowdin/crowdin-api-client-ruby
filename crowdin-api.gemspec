# -*- encoding: utf-8 -*-
require File.expand_path('../lib/crowdin-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Crowdin"]
  gem.email         = ["support@crowdin.net"]
  gem.description   = %q{The Crowdin Ruby Client is used to interact with the Crowdin API from Ruby}
  gem.summary       = %q{The Crowdin Ruby Client is used to interact with the Crowdin API from Ruby}
  gem.homepage      = "https://github.com/crowdin/crowdin-cli"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "crowdin-api"
  gem.require_paths = ["lib"]
  gem.version       = Crowdin::API::VERSION

  gem.add_dependency('rest-client')
end
