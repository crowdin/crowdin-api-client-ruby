require 'sinatra/base'

class FakeCrowdin < Sinatra::Base
  get '/api/project/:project_identifier/supported-languages' do
    json_response 200, 'supported-languages.json'
  end

  get '/api/project/supported-languages' do
    json_response 200, 'supported-languages.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
