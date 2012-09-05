module Crowdin

  # API Methods:
  # + Add File 
  # + Update File 
  # + Delete File 
  #  Upload Translations 
  # + Translation Status 
  # + Project Info 
  # +  Download Translations (GET) 
  #  Export Translations 
  #  Account Projects (GET)
  #  Create Project 
  #  Edit Project 
  #  Delete Project 
  # + Create Directory 
  # + Delete Directory 
  # + Download Glossary (GET)
  # - Upload Glossary 
  # + Download TM (GET)
  # + Upload TM 
  # + Supported Languages (GET)
  #
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

    # Upload fresh version of your localization file to Crowdin.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/update-file?key={project-key}
    #
    def update_file(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/update-file",
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
      )
    end

    # Get supported languages list with Crowdin codes mapped to locale name and standarded codes.
    #
    # == Request
    # GET http://api.crowdin.net/api/supported-languages
    #
    def supported_languages
      request(
        :method => :get,
        :path   => "/api/supported-languages",
      )
    end

    # Track your Crowdin project translation progress by language. Default response format is XML.
    #
    # == Request
    # POST http://api.crowdin.net/api/project/{project-identifier}/status?key={project-key}
    #
    def status
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/status",
      )
    end

    # Get Crowdin Project details.
    #
    # == Request
    # POST http://api.crowdin.net/api/project/{project-identifier}/info?key={project-key}
    #
    def info
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/info",
      )
    end

    # Download Crowdin project glossaries as TBX file.
    #
    # == Request
    # GET http://api.crowdin.net/api/project/{project-identifier}/download-glossary?key={project-key}
    #
    def download_glossary
      request(
        :method => :get,
        :path   => "/api/project/#{@project_identifier}/download-glossary",
      )
    end

    # Download Crowdin project Translation Memory as TMX file.
    #
    # == Request
    # GET http://api.crowdin.net/api/project/{project-identifier}/download-tm?key={project-key}
    #
    def download_tm
      request(
        :method => :get,
        :path   => "/api/project/#{@project_identifier}/download-tm",
      )
    end

    # TODO
    # Upload your glossarries for Crowdin Project in TBX file format.
    #
    # == Request
    # POST http://api.crowdin.net/api/project/{project-identifier}/upload-glossary?key={project-key}
    #
    def upload_glossary(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/upload-glossary",
        :query  => params
      )
    end

    # Upload your Translation Memory for Crowdin Project in TMX file format.
    #
    # == Request
    # POST http://api.crowdin.net/api/project/{project-identifier}/upload-tm?key={project-key}
    #
    def upload_tm(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/upload-tm",
        :query  => params
      )
    end

  end
end
