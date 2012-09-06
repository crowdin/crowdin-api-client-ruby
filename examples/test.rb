# -*- encoding: utf-8 -*-

require 'bundler'
Bundler.setup :default

require 'pp'
require 'crowdin-api'

puts Crowdin::API::VERSION

API_KEY = 'a5f09a295da77883f9025a475d7bcedb'
PROJECT_IDENTIFIER = 'rubytest'

crowdin = Crowdin::API.new(:api_key => API_KEY, :project_identifier => PROJECT_IDENTIFIER)

#crowdin.add_directory(:name => 'test')
#crowdin.delete_directory(:name => 'test')
#crowdin.add_file(:files => {'/test1/ua.txt' => File.new('ua.txt', 'rb'), 'ru.txt' => File.new('ru.txt', 'rb')}, :type => 'auto')
#crowdin.add_file(:files => {'ua.txt' => File.new('ua.txt', 'rb')}, :type => 'auto')
#crowdin.update_file(:files => {'/test1/ua.txt' => File.new('ua.txt', 'rb')})
#crowdin.delete_file(:file => 'ru.txt')
#crowdin.download
#crowdin.supported_languages
#crowdin.status
#crowdin.info
#crowdin.download_glossary
#crowdin.download_tm.body
#crowdin.upload_glossary(:file => File.new('project.tbx', 'rb'))
#crowdin.upload_tm(:file => File.new('project.tmx', 'rb'))
