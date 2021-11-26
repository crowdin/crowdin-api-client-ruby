require 'spec_helper'

describe Crowdin::Client do
  it 'should have a version' do
    expect(Crowdin::Client::VERSION).to_not be_nil
  end
end
