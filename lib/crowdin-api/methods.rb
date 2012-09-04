module Crowdin
  class API

    # Add directory to Crowdin project.
    #
    # == Request
    # POST http://api.crowdin.net/api/project/{project-identifier}/add-directory?key={project-key}
    #
    def add_directory(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/add-directory",
        :query  => params
      )
    end

    # Delete Crowdin project directory. All nested files and directories will be deleted too.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/delete-directory?key={project-key}
    #
    def delete_directory(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/delete-directory",
        :query  => params
      )
    end

    # Add new file to Crowdin project.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/add-file?key={project-key}
    #
    def add_file(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/add-file",
        :query  => params
      )
    end

    # Delete file from Crowdin project. All the translations will be lost without ability to restore them.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/delete-file?key={project-key}
    #
    def delete_file(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/delete-file",
        :query  => params
      )
    end

    # Download ZIP file with translations. You can choose the language of translation you need or download all of them at once.
    # Note: If you would like to download the most recent translations you may want to use export API method before downloading.
    #
    # == Request
    #
    # GET http://api.crowdin.net/api/project/{project-identifier}/download/{package}.zip?key={project-key}
    #
    def download(package)
      request(
        :method => :get,
        :path   => "/api/project/#{@project_identifier}/download/#{package}.zip",
        :query  => {}
      )
    end


  end
end
