module Crowdin
  # A wrapper and interface to the Crowdin api. Please visit the Crowdin developers
  # site for a full explanation of what each of the Crowdin api methods
  # expect and perform.
  #
  # https://support.crowdin.com/api/v2/

  class API

    def list_directories(params = {})
      request(
        method: :get,
        path: "/api/v2/projects/#{@project_id}/directories",
        query: params
      )
    end

    def list_branches(params = {})
      request(
        method: :get,
        path: "/api/v2/projects/#{@project_id}/branches",
        query: params
      )
    end

    def delete_branch(branch_id)
      request(
        method: :delete,
        path: "/api/v2/projects/#{@project_id}/branches/#{branch_id}"
      )
    end

  end
end
