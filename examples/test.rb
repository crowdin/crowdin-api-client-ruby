# -*- encoding: utf-8 -*-

require 'bundler'
Bundler.setup :default

require 'pp'
require 'crowdin-api'

puts Crowdin::API::VERSION

API_KEY    = '79323cdcd6b4566154c4fb9c6bbd3be1'
PROJECT_ID = 'rubytestapi'
ACCOUNT_KEY = '9d222455994cad6738b9cf554d85caf2'

crowdin = Crowdin::API.new(
  :api_key     => API_KEY,
  :project_id  => PROJECT_ID,
  :account_key => ACCOUNT_KEY,
)

#puts crowdin.get_projects('anton.linux')

#crowdin.delete_project
#crowdin.add_directory('test')
#crowdin.delete_directory('test')
crowdin.delete_file('/test1/ua.txt')
crowdin.delete_file('/test1/ru.txt')

#=begin
crowdin.add_file(
  [
    {dest: '/test1/ua.txt', source: 'ua.txt', export_pattern: 'test'},
    {dest: '/test1/ru.txt', source: 'ru.txt', title: 'idk'}
])
#=end

#=begin
crowdin.update_file(
  [
    { dest: '/test1/ua.txt', source: 'ua.txt' },
    { dest: '/test1/ru.txt', source: 'ru.txt' }]
)
#=end

#crowdin.upload_translation([{dest: '/test1/ua.txt', source: 'ua.txt' }], 'ru')

#crowdin.download_translation('ru', :output => 'russia-goodbye.zip')
#crowdin.download_glossary(:output => '1.txt')
#crowdin.download_tm


#crowdin.export_translations

#crowdin.supported_languages(:json)
#puts crowdin.translations_status(:json)
#puts crowdin.project_info(:json)

#crowdin.upload_glossary('rubytest.tbx')
#crowdin.upload_tm('project.tmx')

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
