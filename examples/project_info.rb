require 'bundler'
Bundler.setup :default

require 'crowdin-api'
require 'logger'
require 'pp'

puts Crowdin::API::VERSION

API_KEY = '79323cdcd6b4566154c4fb9c6bbd3be1'
PROJECT_ID = 'rubytestapi'

crowdin = Crowdin::API.new(api_key: API_KEY, project_id: PROJECT_ID, base_url: 'https://api.crowdin.com')
crowdin.log = Logger.new $stderr

pp crowdin.supported_languages
#pp crowdin.project_info

# crowdin.add_directory('test')
# file = { :dest => '/test.txt', :source => 'test.txt', :export_pattern => '/%three_letters_code%/%original_file_name%' }
# crowdin.add_file([] << file)
# crowdin.update_file([] << file)
