<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://support.crowdin.com/assets/logos/symbol/png/crowdin-symbol-cWhite.png">
    <source media="(prefers-color-scheme: light)" srcset="https://support.crowdin.com/assets/logos/symbol/png/crowdin-symbol-cDark.png">
    <img width="150" height="150" src="https://support.crowdin.com/assets/logos/symbol/png/crowdin-symbol-cDark.png">
  </picture>
</p>

# Crowdin Ruby client

The Crowdin Ruby client is a lightweight interface to the Crowdin API. It provides common services for making API requests.

Crowdin API is a full-featured RESTful API that helps you to integrate localization into your development process. The endpoints that we use allow you to easily make calls to retrieve information and to execute actions needed.

<div align="center">

[**`API Client Docs`**](http://crowdin.github.io/crowdin-api-client-ruby/) &nbsp;|&nbsp;
[**`Crowdin API`**](https://developer.crowdin.com/api/v2/) &nbsp;|&nbsp;
[**`Crowdin Enterprise API`**](https://developer.crowdin.com/enterprise/api/v2/)

[![Gem](https://img.shields.io/gem/v/crowdin-api?logo=ruby&cacheSeconds=1800)](https://rubygems.org/gems/crowdin-api)
[![Gem](https://img.shields.io/gem/dt/crowdin-api?cacheSeconds=1800)](https://rubygems.org/gems/crowdin-api)
[![Gem](https://img.shields.io/gem/dtv/crowdin-api?cacheSeconds=1800)](https://rubygems.org/gems/crowdin-api)
[![Test and Lint](https://github.com/crowdin/crowdin-api-client-ruby/actions/workflows/test-and-lint.yml/badge.svg)](https://github.com/crowdin/crowdin-api-client-ruby/actions/workflows/test-and-lint.yml)
[![codecov](https://codecov.io/gh/crowdin/crowdin-api-client-ruby/branch/main/graph/badge.svg?token=OJsyJwQbFM)](https://codecov.io/gh/crowdin/crowdin-api-client-ruby)
[![GitHub](https://img.shields.io/github/license/crowdin/crowdin-api-client-ruby?cacheSeconds=1800)](https://github.com/crowdin/crowdin-api-client-ruby/blob/main/LICENSE)

</div>

## Requirements
* Ruby >= 2.4

## Installation

Add this line to your application's Gemfile:

```gemfile
gem 'crowdin-api', '~> 1.8.1'
```

And then execute:

```console
bundle install
```

Or install it yourself as:

```console
gem install crowdin-api
```

## Quick start

### Initialization

```ruby
require 'crowdin-api'

# Initialize a new Client instance with config options
crowdin = Crowdin::Client.new do |config|
  config.api_token = 'YourApiToken'
end

# Or you can initialize Enterprise Client instance by specifying your
# organization_domain in config options
crowdin = Crowdin::Client.new do |config|
  config.api_token = 'YourEnterpriseApiToken'
  config.organization_domain = 'YourOrganizationDomain'
end
# Note: we use full specified organization domain if that includes '.com'
# config.organization_domain = your_domain -> https://your_domain.api.crowdin.com
# config.organization_domain = your_domain.com -> https://your_domain.com

# All supported Crowdin Client config options now:
crowdin = Crowdin::Client.new do |config|
  config.api_token = 'YourApiToken' # [String] required
  config.organization_domain = 'YourOrganizationDomain' # [String] optional
  config.project_id = 'YourProjectId' # [Integer] nil by default
  config.enable_logger = true # [Boolean] false by default
end
# Note: Client will initialize default Logger instance if you have specify
# enable_logger to true, you can change it by crowdin.logger = YourLogger

# Also you can specify proxy by adding it to ENV['http_proxy'] before Client initialization
```

To generate a new token in Crowdin, follow these steps:
- Go to *Account Settings* > *API* tab, *Personal Access Tokens* section, and click *New Token*.
- Specify *Token Name* and click *Create*.

To generate a new token in Crowdin Enterprise, follow these steps:
- Go to *Account Settings* > *Access tokens* tab and click *New token*.
- Specify *Token Name*, select *Scopes* and *Projects*, click *Create*.

### Usage

```ruby
# Create Project
project = crowdin.add_project(name: your_project_name, sourceLanguageId: your_language_id)

# Get list of Projects
projects = crowdin.list_projects

# Get list of Projects with offset and limit
projects = crowdin.list_projects(offset: 10, limit: 20)

# Get specified project
project = crowdin.get_project(your_project_id)

# Edit project
project = crowdin.edit_project(project_id, [{ op: 'replace',
                                              path: '/name',
                                              value: 'your_new_project_name' }])

# Add Storage
storage = crowdin.add_storage(File.open('YourFilename.extension', 'r'))
# or you can specify only absolute path to file
storage = crowdin.add_storage('YourFilename.extension')

# Download file
file = crowdin.download_file(your_file_id, your_destination, your_project_id)
# your_destination - filename or absolute path to the file, optional
# Without a destination option, the file will not be saved automatically
# project_id is optional, as it can be initialized with a Crowdin Client

# File revisions
# with initialized project_id in your Client
file_revisions = crowdin.list_file_revisions(your_file_id, limit: 10)
# or you can specify your project_id
file_revisions = crowdin.list_file_revisions(your_file_id, { limit: 10 }, your_project_id)

# Note: more examples you can find in spec folder
```

### Fetch all records

There is a possibility to fetch all records from paginatable methods using `fetch_all` method.

```ruby
# FetchAll options:
# * limit, Integer, default: 500 | How many records need to load per one request
# * offset, Integer, default: 0
# * request_delay, Integer (seconds), default: 0 | Delay between requests. To specify a delay in milliseconds use float values like 0.100

# Examples:

@crowdin.fetch_all(:list_projects)

# with options
@crowdin.fetch_all(:list_projects, { limit: 10, request_delay: 1 })

# playing with response per fetch
# Note: the block actually don't make any effect to finite result
@crowdin.fetch_all(:list_projects, { limit: 10, request_delay: 1 }) { |response| puts response['data'] }

# also, you could specify a retry configuration to handle some exceptions
# fetch all execution will be terminated if response status code is the same as one of the error_messages array value
# otherwise, the request will be retried so many times, as indicated at retries_count
@crowdin.fetch_all(:list_projects, {}, { request_delay: 2, retries_count: 3, error_messages: ['401'] })
```

### Command-Line Client

The Crowdin Ruby client support crowdin-console, where you can test endpoints easier

```console
$ bundle exec crowdin-console --enable-logger --api-token API_TOKEN --project-id PROJECT_ID
```

Or Crowdin Enterprise

```console
$ bundle exec crowdin-console --enable-logger --enterprise --api-token API_TOKEN --organization-domain DOMAIN --project-id PROJECT_ID
```
Note: you can specify full organization domain by adding '.com'

When execute you'll have IRB console with configured *@crowdin* instance

```
> @crowdin.list_projects
```

## Seeking Assistance

If you find any problems or would like to suggest a feature, please read the [How can I contribute](/CONTRIBUTING.md#how-can-i-contribute) section in our contributing guidelines.

## Contributing

If you would like to contribute please read the [Contributing](/CONTRIBUTING.md) guidelines.

## License

<pre>
The Crowdin Ruby Client is licensed under the MIT License.
See the LICENSE.md file distributed with this work for additional 
information regarding copyright ownership.

Except as contained in the LICENSE file, the name(s) of the above copyright
holders shall not be used in advertising or otherwise to promote the sale,
use or other dealings in this Software without prior written authorization.
</pre>
