# frozen_string_literal: true

describe Crowdin::ApiResources::Ai do
  describe 'Default endpoints' do
    describe '#get_project_ai_settings' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/ai/settings")
        result = @crowdin.get_project_ai_settings(project_id)
        expect(result).to eq(200)
      end
    end

    describe '#ai_file_translations' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/file-translations")
        result = @crowdin.ai_file_translations({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#cancel_file_translations' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/ai/file-translations/1")
        result = @crowdin.cancel_file_translations(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_file_translations_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/file-translations/1")
        result = @crowdin.get_file_translations_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_translated_file' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/file-translations/1/download")
        result = @crowdin.download_translated_file(1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_translated_file_strings' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/file-translations/1/translations")
        result = @crowdin.download_translated_file_strings(1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_prompts' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts")
        result = @crowdin.list_ai_prompts({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#add_ai_prompt' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts")
        result = @crowdin.add_ai_prompt({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_prompt_fine_tuning_jobs' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/fine-tuning/jobs")
        result = @crowdin.list_ai_prompt_fine_tuning_jobs({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#delete_ai_prompt' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1")
        result = @crowdin.delete_ai_prompt(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1")
        result = @crowdin.get_ai_prompt(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_prompt' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1")
        result = @crowdin.edit_ai_prompt(1, [], 1)
        expect(result).to eq(200)
      end
    end

    describe '#clone_ai_prompt' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/clones")
        result = @crowdin.clone_ai_prompt(1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#generate_ai_prompt_completion' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/completions")
        result = @crowdin.generate_ai_prompt_completion(1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#cancel_ai_prompt_completion' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/completions/1")
        result = @crowdin.cancel_ai_prompt_completion(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt_completion_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/completions/1")
        result = @crowdin.get_ai_prompt_completion_status(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_prompt_completion' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/completions/1/download")
        result = @crowdin.download_ai_prompt_completion(1, 1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#generate_ai_prompt_fine_tuning_dataset' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/fine-tuning/datasets")
        result = @crowdin.generate_ai_prompt_fine_tuning_dataset(1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt_fine_tuning_dataset_generation_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/fine-tuning/datasets/1")
        result = @crowdin.get_ai_prompt_fine_tuning_dataset_generation_status(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_prompt_fine_tuning_dataset' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/fine-tuning/datasets/1/download")
        result = @crowdin.download_ai_prompt_fine_tuning_dataset(1, 1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#create_ai_prompt_fine_tuning_job' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/fine-tuning/jobs")
        result = @crowdin.create_ai_prompt_fine_tuning_job(1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt_fine_tuning_job_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/fine-tuning/jobs/1")
        result = @crowdin.get_ai_prompt_fine_tuning_job_status(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_prompt_fine_tuning_events' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/prompts/1/fine-tuning/jobs/1/events")
        result = @crowdin.list_ai_prompt_fine_tuning_events(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_providers' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers")
        result = @crowdin.list_ai_providers({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#add_ai_provider' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers")
        result = @crowdin.add_ai_provider({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_all_ai_provider_models' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/models")
        result = @crowdin.list_all_ai_provider_models(1)
        expect(result).to eq(200)
      end
    end

    describe '#list_supported_ai_provider_models' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/supported-models")
        result = @crowdin.list_supported_ai_provider_models({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#delete_ai_provider' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1")
        result = @crowdin.delete_ai_provider(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_provider' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1")
        result = @crowdin.get_ai_provider(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_provider' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1")
        result = @crowdin.edit_ai_provider(1, [], 1)
        expect(result).to eq(200)
      end
    end

    describe '#create_ai_proxy_chat_completion' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/chat/completions")
        result = @crowdin.create_ai_proxy_chat_completion(1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_delete' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_delete(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_get' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_get(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_patch' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_patch(1, 1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_post' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_post(1, 1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_put' do
      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_put(1, 1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_provider_models' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/providers/1/models")
        result = @crowdin.list_ai_provider_models(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#generate_ai_report' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/reports")
        result = @crowdin.generate_ai_report({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#check_ai_report_generation_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/reports/1")
        result = @crowdin.check_ai_report_generation_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_report' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/reports/1/download")
        result = @crowdin.download_ai_report(1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_request_logs' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/request-logs")
        result = @crowdin.list_ai_request_logs({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#export_ai_request_logs' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/request-logs/exports")
        result = @crowdin.export_ai_request_logs({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#check_ai_request_logs_export_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/request-logs/exports/1")
        result = @crowdin.check_ai_request_logs_export_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_request_logs_export' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/request-logs/exports/1/download")
        result = @crowdin.download_ai_request_logs_export(1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_settings' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings")
        result = @crowdin.get_ai_settings(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_settings' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings")
        result = @crowdin.edit_ai_settings([], 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_snippets' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings/snippets")
        result = @crowdin.list_ai_snippets({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#add_ai_snippet' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings/snippets")
        result = @crowdin.add_ai_snippet({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#delete_ai_snippet' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings/snippets/1")
        result = @crowdin.delete_ai_snippet(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_snippet' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings/snippets/1")
        result = @crowdin.get_ai_snippet(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_snippet' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/users/1/ai/settings/snippets/1")
        result = @crowdin.edit_ai_snippet(1, [], 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_translate_strings' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/ai/translate")
        result = @crowdin.ai_translate_strings({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_usage_members' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/usage/members")
        result = @crowdin.list_ai_usage_members({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_usage_member' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/ai/usage/members/1")
        result = @crowdin.get_ai_usage_member(1, 1)
        expect(result).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#ai_file_translations' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/file-translations")
        result = @crowdin.ai_file_translations({})
        expect(result).to eq(200)
      end
    end

    describe '#cancel_file_translations' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/ai/file-translations/1")
        result = @crowdin.cancel_file_translations(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_file_translations_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/file-translations/1")
        result = @crowdin.get_file_translations_status(1)
        expect(result).to eq(200)
      end
    end

    describe '#download_translated_file' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/file-translations/1/download")
        result = @crowdin.download_translated_file(1, nil)
        expect(result).to eq(200)
      end
    end

    describe '#download_translated_file_strings' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/file-translations/1/translations")
        result = @crowdin.download_translated_file_strings(1, nil)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_prompts' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts")
        result = @crowdin.list_ai_prompts({})
        expect(result).to eq(200)
      end
    end

    describe '#add_ai_prompt' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts")
        result = @crowdin.add_ai_prompt({})
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_prompt_fine_tuning_jobs' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/fine-tuning/jobs")
        result = @crowdin.list_ai_prompt_fine_tuning_jobs({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_ai_prompt' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1")
        result = @crowdin.delete_ai_prompt(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1")
        result = @crowdin.get_ai_prompt(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_prompt' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1")
        result = @crowdin.edit_ai_prompt(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#clone_ai_prompt' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/clones")
        result = @crowdin.clone_ai_prompt(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#generate_ai_prompt_completion' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/completions")
        result = @crowdin.generate_ai_prompt_completion(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#cancel_ai_prompt_completion' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/completions/1")
        result = @crowdin.cancel_ai_prompt_completion(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt_completion_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/completions/1")
        result = @crowdin.get_ai_prompt_completion_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_prompt_completion' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/completions/1/download")
        result = @crowdin.download_ai_prompt_completion(1, 1, nil)
        expect(result).to eq(200)
      end
    end

    describe '#generate_ai_prompt_fine_tuning_dataset' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/fine-tuning/datasets")
        result = @crowdin.generate_ai_prompt_fine_tuning_dataset(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt_fine_tuning_dataset_generation_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/fine-tuning/datasets/1")
        result = @crowdin.get_ai_prompt_fine_tuning_dataset_generation_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_prompt_fine_tuning_dataset' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/fine-tuning/datasets/1/download")
        result = @crowdin.download_ai_prompt_fine_tuning_dataset(1, 1, nil)
        expect(result).to eq(200)
      end
    end

    describe '#create_ai_prompt_fine_tuning_job' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/fine-tuning/jobs")
        result = @crowdin.create_ai_prompt_fine_tuning_job(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_prompt_fine_tuning_job_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/fine-tuning/jobs/1")
        result = @crowdin.get_ai_prompt_fine_tuning_job_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_prompt_fine_tuning_events' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/prompts/1/fine-tuning/jobs/1/events")
        result = @crowdin.list_ai_prompt_fine_tuning_events(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_providers' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers")
        result = @crowdin.list_ai_providers({})
        expect(result).to eq(200)
      end
    end

    describe '#add_ai_provider' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers")
        result = @crowdin.add_ai_provider({})
        expect(result).to eq(200)
      end
    end

    describe '#list_all_ai_provider_models' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/models")
        result = @crowdin.list_all_ai_provider_models
        expect(result).to eq(200)
      end
    end

    describe '#list_supported_ai_provider_models' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/supported-models")
        result = @crowdin.list_supported_ai_provider_models({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_ai_provider' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1")
        result = @crowdin.delete_ai_provider(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_provider' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1")
        result = @crowdin.get_ai_provider(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_provider' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1")
        result = @crowdin.edit_ai_provider(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#create_ai_proxy_chat_completion' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/chat/completions")
        result = @crowdin.create_ai_proxy_chat_completion(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_delete' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_delete(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_get' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_get(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_patch' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_patch(1, 1, {})
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_post' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_post(1, 1, {})
        expect(result).to eq(200)
      end
    end

    describe '#ai_gateway_put' do
      it 'when request are valid', :enterprise do
        stub_request(:put, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/gateway/1")
        result = @crowdin.ai_gateway_put(1, 1, {})
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_provider_models' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/providers/1/models")
        result = @crowdin.list_ai_provider_models(1)
        expect(result).to eq(200)
      end
    end

    describe '#generate_ai_report' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/reports")
        result = @crowdin.generate_ai_report({})
        expect(result).to eq(200)
      end
    end

    describe '#check_ai_report_generation_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/reports/1")
        result = @crowdin.check_ai_report_generation_status(1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_report' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/reports/1/download")
        result = @crowdin.download_ai_report(1, nil)
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_request_logs' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/request-logs")
        result = @crowdin.list_ai_request_logs({})
        expect(result).to eq(200)
      end
    end

    describe '#export_ai_request_logs' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/request-logs/exports")
        result = @crowdin.export_ai_request_logs({})
        expect(result).to eq(200)
      end
    end

    describe '#check_ai_request_logs_export_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/request-logs/exports/1")
        result = @crowdin.check_ai_request_logs_export_status(1)
        expect(result).to eq(200)
      end
    end

    describe '#download_ai_request_logs_export' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/request-logs/exports/1/download")
        result = @crowdin.download_ai_request_logs_export(1, nil)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_settings' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings")
        result = @crowdin.get_ai_settings
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_settings' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings")
        result = @crowdin.edit_ai_settings([])
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_snippets' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings/snippets")
        result = @crowdin.list_ai_snippets({})
        expect(result).to eq(200)
      end
    end

    describe '#add_ai_snippet' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings/snippets")
        result = @crowdin.add_ai_snippet({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_ai_snippet' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings/snippets/1")
        result = @crowdin.delete_ai_snippet(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_snippet' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings/snippets/1")
        result = @crowdin.get_ai_snippet(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_ai_snippet' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/ai/settings/snippets/1")
        result = @crowdin.edit_ai_snippet(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#ai_translate_strings' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/ai/translate")
        result = @crowdin.ai_translate_strings({})
        expect(result).to eq(200)
      end
    end

    describe '#list_ai_usage_members' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/usage/members")
        result = @crowdin.list_ai_usage_members({})
        expect(result).to eq(200)
      end
    end

    describe '#get_ai_usage_member' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/ai/usage/members/1")
        result = @crowdin.get_ai_usage_member(1)
        expect(result).to eq(200)
      end
    end
  end
end
