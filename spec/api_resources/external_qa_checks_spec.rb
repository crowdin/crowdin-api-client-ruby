# frozen_string_literal: true

describe Crowdin::ApiResources::ExternalQaChecks do
  describe 'Enterprise endpoints' do
    describe '#list_external_qa_checks' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/external-qa-checks")
        result = @crowdin.list_external_qa_checks({})
        expect(result).to eq(200)
      end
    end

    describe '#get_external_qa_check' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/external-qa-checks/1")
        result = @crowdin.get_external_qa_check(1)
        expect(result).to eq(200)
      end
    end
  end
end
