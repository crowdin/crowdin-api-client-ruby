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
