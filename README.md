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

crowdin = Crowdin::API.new(:api_key => API_KEY)
```

Now you can make requests to the api.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This library is distributed under the MIT license.  Please see the LICENSE file.
