[![Build Status](http://img.shields.io/travis/OpenAddressesUK/angerfist.svg)](https://travis-ci.org/OpenAddressesUK/angerfist)
[![Dependency Status](http://img.shields.io/gemnasium/OpenAddressesUK/angerfist.svg)](https://gemnasium.com/OpenAddressesUK/angerfist)
[![Code Climate](http://img.shields.io/codeclimate/github/OpenAddressesUK/angerfist.svg)](https://codeclimate.com/github/OpenAddressesUK/angerfist)
[![Gem Version](http://img.shields.io/gem/v/angerfist.svg)](https://rubygems.org/gems/angerfist)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://OpenAddressesUK.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

# Angerfist

A Rack Middleware wrapper around [Gabba](https://github.com/hybridgroup/gabba) which sends server-side notifications to Google Analytics.

Allows filtering by content type or url string

## Setup

Add the following to your app's Gemfile:

```
gem 'angerfist'
```

Then follow the instructions, depending on what Rack-based platform you're using.

### Sinatra

Add `use Rack::Angerfist` to your Sinatra application like so

```ruby
class App < Sinatra::Base
    use Rack::Angerfist, tracker_id: GA_TRACKER_ID, domain: GA_TRACKER_DOMAIN
end
```

Where `GA_TRACKER_ID` is your Google Analytics Tracker ID and `GA_TRACKER_DOMAIN` is your app's domain.

### Rails

Add `angerfist.rb` to your app's initializers folder with the following content:

```ruby
config = {
  tracker_id: GA_TRACKER_ID,
  domain: GA_TRACKER_DOMAIN,
}

Rails.application.config.middleware.use(Rack::Angerfist, config)
```

Where `GA_TRACKER_ID` is your Google Analytics Tracker ID and `GA_TRACKER_DOMAIN` is your app's domain.

## Additional options

If you only want to filter by content type (for example, if you want to track usage of a JSON API), you can add the an array of content types to your config, like so:

### Sinatra

```ruby
use Rack::Angerfist, tracker_id: GA_TRACKER_ID, domain: GA_TRACKER_DOMAIN, content_types: ["application/json"]
```

### Rails

```ruby
config = {
  tracker_id: GA_TRACKER_ID,
  domain: GA_TRACKER_DOMAIN,
  content_types: ["application/json"]
}

Rails.application.config.middleware.use(Rack::Angerfist, config)
```

If you want to filter by page path, you can similarly add an array of paths to your config like so:


### Sinatra

```ruby
use Rack::Angerfist, tracker_id: GA_TRACKER_ID, domain: GA_TRACKER_DOMAIN, paths: ["/path"]
```

### Rails

```ruby
config = {
  tracker_id: GA_TRACKER_ID,
  domain: GA_TRACKER_DOMAIN,
  paths: ["/path"]
}

Rails.application.config.middleware.use(Rack::Angerfist, config)
```

## Licence

The code is open source under the MIT license. See the LICENSE.md file for full details.
