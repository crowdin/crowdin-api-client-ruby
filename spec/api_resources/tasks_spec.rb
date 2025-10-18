# frozen_string_literal: true

describe Crowdin::ApiResources::Tasks do
  describe 'Default endpoints' do
    describe '#list_tasks' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks")
        list_tasks = @crowdin.list_tasks({}, project_id)
        expect(list_tasks).to eq(200)
      end
    end

    describe '#add_task' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks")
        add_task = @crowdin.add_task({}, project_id)
        expect(add_task).to eq(200)
      end
    end

    describe '#export_task_strings' do
      let(:task_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}/exports")
        export_task_strings = @crowdin.export_task_strings(task_id, nil, project_id)
        expect(export_task_strings).to eq(200)
      end
    end

    describe '#get_task' do
      let(:task_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}")
        get_task = @crowdin.get_task(task_id, project_id)
        expect(get_task).to eq(200)
      end
    end

    describe '#delete_task' do
      let(:task_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}")
        delete_task = @crowdin.delete_task(task_id, project_id)
        expect(delete_task).to eq(200)
      end
    end

    describe '#edit_task' do
      let(:task_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}")
        edit_task = @crowdin.edit_task(task_id, {}, project_id)
        expect(edit_task).to eq(200)
      end
    end

    describe '#list_user_tasks' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/user/tasks")
        list_user_tasks = @crowdin.list_user_tasks({})
        expect(list_user_tasks).to eq(200)
      end
    end

    describe '#edit_task_archived_status' do
      let(:task_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/user/tasks/#{task_id}")
        edit_task_archived_status = @crowdin.edit_task_archived_status(task_id, {})
        expect(edit_task_archived_status).to eq(200)
      end
    end
  end
end

  describe 'Task Comments endpoints' do
    let(:task_id) { 1 }
    let(:comment_id) { 101 }

    describe '#list_task_comments' do
      it 'when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments")
        list_task_comments = @crowdin.list_task_comments(project_id, task_id, {})
        expect(list_task_comments).to eq(200)
      end
    end

    describe '#get_task_comment' do
      it 'when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}")
        get_task_comment = @crowdin.get_task_comment(project_id, task_id, comment_id)
        expect(get_task_comment).to eq(200)
      end
    end

    describe '#add_task_comment' do
      it 'when request is valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments")
        add_task_comment = @crowdin.add_task_comment(project_id, task_id, { text: 'New comment' })
        expect(add_task_comment).to eq(200)
      end
    end

    describe '#edit_task_comment' do
      it 'when request is valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}")
        edit_task_comment = @crowdin.edit_task_comment(project_id, task_id, comment_id, { text: 'Updated comment' })
        expect(edit_task_comment).to eq(200)
      end
    end

    describe '#delete_task_comment' do
      it 'when request is valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}")
        delete_task_comment = @crowdin.delete_task_comment(project_id, task_id, comment_id)
        expect(delete_task_comment).to eq(200)
      end
    end
  end