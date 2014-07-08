# Crowdin::API

The Crowdin Ruby Client is used to interact with the Crowdin API from Ruby.

For more about the Crowdin API see <http://crowdin.net/page/api>.

> **WARNING**: This is a development version: It contains the latest changes, but may also have severe known issues, including crashes and data loss situations. In fact, it may not work at all.

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

crowdin = Crowdin::API.new(api_key: API_KEY, project_id: PROJECT_ID, account_key: ACCOUNT_KEY)
crowdin.log = Logger.new $stderr
```

Now you can make requests to the api.

### Add File

Add new file to Crowdin project.

Documentation:  <http://crowdin.net/page/api/add-file>.

First parameter is array of files that should be added to Crowdin project.
Every file is hash:
* `:dest` - file name with path in Crowdin project (required)
* `:source` - uploaded file (required)
* `:title` - title for uploaded file (optional)
* `:export_pattern` - string that defines name of resulted file (optional)


```ruby
crowdin.add_file(
  files = [
    { :dest => '/directory/array.xml', :source => 'array.xml', :export_pattern => '/values-%two_letters_code%/%original_file_name%' },
    { :dest => 'strings.xml', :source => 'strings.xml', :title => 'Texts in Application' }
], :type => 'android')
```

### Update File

Upload fresh version of your localization file.

Documentation <http://crowdin.net/page/api/update-file>

First parameter is array of files that should be updated in Crowdin project.
Every file is hash:
* `:dest` - file name with path in Crowdin project (required)
* `:source` - uploaded file (required)
* `:title` - title for uploaded file (optional)
* `:export_pattern` - string that defines name of resulted file (optional)

```ruby
crowdin.update_file(
  files = [
    { :dest => '/directory/array.xml', :source => 'array.xml', :export_pattern => '/values-%two_letters_code%/%original_file_name%'},
    { :dest => 'strings.xml', :source => 'strings.xml' }
])

```

### Delete File

Remove file from Crowdin project.

Documentation <http://crowdin.net/page/api/delete-file>

```ruby
crowdin.delete_file('strings.xml')
```

### Create Directory

Create a new directory in Crowdin project.

Documentation: <http://crowdin.net/page/api/add-directory>

```ruby
crowdin.add_directory('dirname')
```

### Delete Directory

Remove directory with nested files from Crowdin project.

Documentation: <http://crowdin.net/page/api/delete-directory>

```ruby
crowdin.delete_directory('dirname')
```

### Upload Translations

Upload translations made in a third party software or previously made translations.

Documentation: <http://crowdin.net/page/api/upload-translation>

First parameter is array of translated files that should be added to Crowdin project.
Every file is hash:
* `:dest` - file names in Crowdin (required)
* `:source` - uploaded translation (required)

Second parameter is target language.
With a single call it's possible to upload translations for several files but only into one of the languages.
Check [complete list of Crowdin language codes](http://crowdin.net/page/api/language-codes) that can be used.

Optional params:
* `:import_duplicates` - defines whether to add translation if there is the same translation previously added (default: false)
* `:import_eq_suggestions` - defines whether to add translation if it is equal to source string at Crowdin (default: false)
* `:auto_approve_imported` - mark uploaded translations as approved (default: false)

```ruby
crowdin.upload_translation(
  files = [
    { :dest => 'strings.xml', :source => 'strings_uk.xml' },
    { :dest => 'array.xml', :source => 'array_uk.xml' }
  ],
  language = 'uk',
  params = {:import_duplicates => true}
)
```

### Download Translations

Download last exported translation package (one target language or all languages as one zip file).

Documentation: <http://crowdin.net/page/api/download>

First parameter is the language of translation you need or download `all` of them at once.

```ruby
crowdin.download_translation('ru', :output => '/path/to/download/ru_RU.zip')
```

### Translation Status

Track overall translation and proofreading progress of each target language.

Documentation: <http://crowdin.net/page/api/status>

```ruby
crowdin.translations_status
```

### Project Info

Shows project details and meta information (last translations date, currently uploaded files, target languages etc..).

Documentation: <http://crowdin.net/page/api/info>

```ruby
crowdin.project_info
```

### Export Translations

Build ZIP archive with the latest translations.

Documentation: <http://crowdin.net/page/api/export>

```ruby
crowdin.export_translations
```

### Account Projects

Documentation: <http://crowdin.net/page/api/get-projects>

### Create Project

Documentation: <http://crowdin.net/page/api/create-project>

### Edit Project

Documentation: <http://crowdin.net/page/api/edit-project>

### Delete Project

Documentation: <http://crowdin.net/page/api/delete-project>

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

## License and Author

Author: Anton Maminov (anton.maminov@gmail.com)

Copyright: 2012-2014 [Crowdin.net](http://crowdin.net/)

This library is distributed under the MIT license. Please see the LICENSE file.
