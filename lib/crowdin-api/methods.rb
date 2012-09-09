module Crowdin

  # API Methods:
  # + Add File
  # + Update File
  # + Delete File
  # + Upload Translations
  # + Translation Status
  # + Project Info
  # + Download Translations (GET)
  # + Export Translations
  # + Account Projects (GET)
  # + Create Project
  # - Edit Project
  # + Delete Project
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
    #
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
    def download(params = {})
      request(
        :method  => :get,
        :path    => "/api/project/#{@project_identifier}/download/#{params[:package] || 'all'}.zip",
        :output  => params[:output]
      )
    end

    # Build ZIP archive with the latest translations. Please note that this method can be invoked only every 30 minutes. Also API call will be ignored if there were no any changes in project since last export.
    #
    # == Request
    #
    # POST POST http://api.crowdin.net/api/project/{project-identifier}/export?key={project-key}
    #
    def export(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/export",
        :query  => params
      )
    end

    # Upload existing translations to your Crowdin project.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/upload-translation?key={project-key}
    #
    def upload_translation(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/upload-translation",
        :query  => params
      )
    end

    # Get supported languages list with Crowdin codes mapped to locale name and standarded codes.
    #
    # == Request
    #
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
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/status?key={project-key}
    #
    def status(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/status",
        :query  => params
      )
    end

    # Get Crowdin Project details.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/info?key={project-key}
    #
    def info(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/info",
        :query  => params
      )
    end

    # Download Crowdin project glossaries as TBX file.
    #
    # == Request
    #
    # GET http://api.crowdin.net/api/project/{project-identifier}/download-glossary?key={project-key}
    #
    def download_glossary(params = {})
      request(
        :method => :get,
        :path   => "/api/project/#{@project_identifier}/download-glossary",
        :output => params[:output]
      )
    end

    # Download Crowdin project Translation Memory as TMX file.
    #
    # == Request
    #
    # GET http://api.crowdin.net/api/project/{project-identifier}/download-tm?key={project-key}
    #
    def download_tm(params = {})
      request(
        :method => :get,
        :path   => "/api/project/#{@project_identifier}/download-tm",
        :output => params[:output]
      )
    end

    # TODO
    # Upload your glossarries for Crowdin Project in TBX file format.
    #
    # == Request
    #
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
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/upload-tm?key={project-key}
    #
    def upload_tm(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/upload-tm",
        :query  => params
      )
    end

    # Create new Crowdin project.
    # Important: The API method requires Account API Key. This key can not be found on your profile pages, please contact us to obtain API key for your account.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/account/create-project?account-key={account-key}
    #
    def create_project(params)
      request(
        :method => :post,
        :path   => "/api/account/create-project",
        :query  => params
      )
    end

    # Edit Crowdin project.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/edit-project?key={key}
    #
    def edit_project(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/edit-project",
        :query  => params
      )
    end

    # Delete Crowdin project with all translations.
    #
    # == Request
    #
    # POST http://api.crowdin.net/api/project/{project-identifier}/delete-project?key={project-key}
    #
    def delete_project(params)
      request(
        :method => :post,
        :path   => "/api/project/#{@project_identifier}/delete-project",
        :query  => params
      )
    end

    # Get Crowdin Project details.
    #
    # == Request
    #
    # GET http://api.crowdin.net/api/account/get-projects?key={account-key}
    #
    def get_projects(params)
      request(
        :method => :get,
        :path   => "/api/account/get-projects",
        :query  => params
      )
    end

  end
end
