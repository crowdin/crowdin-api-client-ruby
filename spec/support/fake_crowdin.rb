require 'sinatra/base'

class FakeCrowdin < Sinatra::Base
  get '/api/v2/projects/:project_identifier/directories' do
    json_response 200, 'directories.json'
  end

  get '/api/v2/projects/directories' do
    json_response 200, 'directories.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
