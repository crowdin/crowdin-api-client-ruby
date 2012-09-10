# -*- encoding: utf-8 -*-

require 'bundler'
Bundler.setup :default

require 'pp'
require 'crowdin-api'

puts Crowdin::API::VERSION

API_KEY    = '79323cdcd6b4566154c4fb9c6bbd3be1'
PROJECT_ID = 'rubytestapi'

crowdin = Crowdin::API.new(
  :api_key => API_KEY,
  :project_id => PROJECT_ID,
  :base_url => 'http://api.crowdin.net')

#crowdin.add_directory(:name => 'test')
#crowdin.delete_directory(:name => 'test')
#crowdin.add_file(:files => {'/test1/ua.txt' => File.new('ua.txt', 'rb'), 'ru.txt' => File.new('ru.txt', 'rb')}, :type => 'auto')
#crowdin.add_file(:files => {'ua.txt' => File.new('ua.txt', 'rb')}, :type => 'auto')
#crowdin.update_file(:files => {'/test1/ua.txt' => File.new('ua.txt', 'rb')})
#crowdin.delete_file(:file => 'ru.txt')
#puts crowdin.upload_translation(:files => {'ua.txt' => File.new('ua.txt', 'rb')}, :language => 'ru')
#crowdin.download_translation(:package => 'ru', :output => 'all-in-one.zip')
#crowdin.download_glossary(:output => '1.txt')
#crowdin.download_tm
#crowdin.export_translations
#crowdin.supported_languages
puts crowdin.translations_status(:json => true)
puts crowdin.project_info(:json => true)
#crowdin.upload_glossary(:file => File.new('rubytest.tbx', 'rb'))
#crowdin.upload_tm(:file => File.new('project.tmx', 'rb'))
=begin
crowdin.create_project(
  :login           => 'anton.linux',
  :name            => 'This is a test project',
  :identifier      => 'rubytestapi',
  :source_language => 'en',
  :languages       => ['fr', 'ru'],
  :join_policy     => 'open'

)
=end
#puts crowdin.edit_project(:description => 'This is a ruby test project')

#crowdin.delete_project
#puts crowdin.get_projects(:login => 'anton.linux')
