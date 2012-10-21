# encoding: utf-8

require 'bundler'
Bundler.setup :default

require 'crowdin-api'
require 'logger'
require 'pp'

puts Crowdin::API::VERSION

API_KEY = '79323cdcd6b4566154c4fb9c6bbd3be1'
PROJECT_ID = 'rubytestapi'

crowdin = Crowdin::API.new(:api_key => API_KEY, :project_id => PROJECT_ID)
crowdin.log = Logger.new $stderr

pp crowdin.project_info

#file = { :dest => '/arrays.xml', :source => 'arrays.xml', :export_pattern => '/values-%three_letters_code%/%original_file_name%' }
#crowdin.add_file([] << file)
#crowdin.update_file([] << file)
