# -*- encoding: utf-8 -*-

require 'bundler'
Bundler.setup :default

require 'pp'
require 'crowdin-api'

puts Crowdin::API::VERSION

API_KEY = 'a5f09a295da77883f9025a475d7bcedb'
PROJECT_IDENTIFIER = 'rubytest'

crowdin = Crowdin::API.new(:api_key => API_KEY, :project_identifier => PROJECT_IDENTIFIER)

pp crowdin.add_directory(:name => 'test')
#pp crowdin.delete_directory(:name => 'test')
#pp crowdin.add_file(:files => {'/test1/ua.txt' => File.new('ua.txt', 'rb'), 'ru.txt' => File.new('ru.txt', 'rb')}, :type => 'auto')
#puts crowdin.update_file(:files => {'/test1/ua.txt' => File.new('ua.txt', 'rb')})
#pp crowdin.delete_file(:file => 'ru.txt')
#puts crowdin.download('all')
#puts crowdin.supported_languages
#puts crowdin.status
#puts crowdin.info
#puts crowdin.download_glossary
#puts crowdin.download_tm
#puts crowdin.upload_glossary(:file => File.new('project.tbx', 'rb'))
#puts crowdin.upload_tm(:file => File.new('project.tmx', 'rb'))
