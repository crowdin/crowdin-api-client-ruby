require 'crowdin-api'

describe 'Client instance' do
  it 'should have a project_id' do
    @crowdin = Crowdin::Client.new(project_id: 1)

    expect(@crowdin.project_id).to_not be_nil
  end
end
