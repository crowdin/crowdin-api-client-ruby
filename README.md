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

crowdin = Crowdin::API.new(:api_key => API_KEY, :project_id => PROJECT_ID, :account_key => ACCOUNT_KEY)
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
    { :dest => 'string.xml', :source => 'strings.xml', :title => 'Texts in Application' }
], :type => 'android')
```

### Update File

### Delete File

### Upload Translations

### Translation Status

### Project Info

### Download Translations

Documentation: <http://crowdin.net/page/api/download>

First parameter is the language of translation you need or download `all` of them at once.

```ruby
crowdin.download_translation('ru', :output => '/path/to/download/ru_RU.zip')
```

### Export Translations

### Account Projects

### Create Project

### Edit Project

### Delete Project

### Create Directory

### Delete Directory

### Download Glossary

### Upload Glossary

### Download TM

### Upload TM

###Supported Languages


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This library is distributed under the MIT license.  Please see the LICENSE file.
