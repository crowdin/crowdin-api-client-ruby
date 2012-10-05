# Crowdin::API

The Crowdin Ruby Client is used to interact with the Crowdin API from Ruby.

For more about the Crowdin API see <http://crowdin.net/page/api>.

## Installation

Add this line to your application's Gemfile:

```
gem 'crowdin-api'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install crowdin-api
```

## Usage

Start by creating a connection to Crowdin with your credentials:

```ruby
require 'crowdin-api'
require 'logger'

crowdin = Crowdin::API.new(:api_key => API_KEY, :project_id => PROJECT_ID, :account_key => ACCOUNT_KEY)
crowdin.log = Logger.new $stderr
```

Now you can make requests to the api.

### Add File

Documentation:  <http://crowdin.net/page/api/add-file>.

First parameter is array of files that should be added to Crowdin project.
Every file is hash:
* `:dest` - file name with path in Crowdin project (_required_)
* `:source` - uploaded file (_required_)
* `:title` - title for uploaded file (_optional_)
* `:export_pattern` - string that defines name of resulted file (_optional_)


```ruby
crowdin.add_file(
  files = [
    { :dest => '/directory/array.xml', :source => 'array.xml', :export_pattern => '/values-%two_letter_code%/%original_file_name%' },
    { :dest => 'strings.xml', :source => 'strings.xml', :title => 'Texts in Application' }
], :type => 'android')
```

### Update File

Documentation <http://crowdin.net/page/api/update-file>

First parameter is array of files that should be updated in Crowdin project.
Every file is hash:
* `:dest` - file name with path in Crowdin project (_required_)
* `:source` - uploaded file (_required_)
* `:title` - title for uploaded file (_optional_)
* `:export_pattern` - string that defines name of resulted file (_optional_)

```ruby
crowdin.update_file(
  files = [
    { :dest => '/directory/array.xml', :source => 'array.xml', :export_pattern => '/values-%two_letter_code%/%original_file_name%'},
    { :dest => 'strings.xml', :source => 'strings.xml' }
])

```

### Delete File

Documentation <http://crowdin.net/page/api/delete-file>

```ruby
crowdin.delete_file('strings.xml')
```

### Upload Translations

Documentation: <http://crowdin.net/page/api/upload-translation>

### Translation Status

Documentation: <http://crowdin.net/page/api/status>

### Project Info

Documentation: <http://crowdin.net/page/api/info>

### Download Translations

Documentation: <http://crowdin.net/page/api/download>

First parameter is the language of translation you need or download `all` of them at once.

```ruby
crowdin.download_translation('ru', :output => '/path/to/download/ru_RU.zip')
```

### Export Translations

Documentation: <http://crowdin.net/page/api/export>

### Account Projects

Documentation: <http://crowdin.net/page/api/get-projects>

### Create Project

Documentation: <http://crowdin.net/page/api/create-project>

### Edit Project

Documentation: <http://crowdin.net/page/api/edit-project>

### Delete Project

Documentation: <http://crowdin.net/page/api/delete-project>

### Create Directory

Documentation: <http://crowdin.net/page/api/add-directory>

### Delete Directory

Documentation: <http://crowdin.net/page/api/delete-directory>

### Download Glossary

Documentation: <http://crowdin.net/page/api/download-glossary>

### Upload Glossary

Documentation: <http://crowdin.net/page/api/upload-glossary>

### Download TM

Documentation: <http://crowdin.net/page/api/download-tm>

### Upload TM

Documentation: <http://crowdin.net/page/api/upload-tm>

### Supported Languages

Documentation: <http://crowdin.net/page/api/supported-languages>


## Supported Rubies

Tested with the following Ruby versions:

- MRI 1.9.3
- JRuby 1.7.0

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This library is distributed under the MIT license.  Please see the LICENSE file.
