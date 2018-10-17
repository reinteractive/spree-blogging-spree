SpreeBloggingSpree
==================

This fork differs significantly from the original, it started out as a newly generated extension for Spree 1.2 with the logic copied over and tests moved to RSpec. Then updated to spree 3.3, and customized heavily for Sterling parts.

A basic blogging solution for use with the [Spree](http://github.com/spree/spree/) E-Commerce platform.

The blog is found under /blog on the website font end. Blog entries have fields for title, body, summary and date published. Each blog entry can also have categories and tags associated with it.

The [Spree Editor](http://github.com/spree/spree_editor/) extension can be used to provide a rich text experience when editing the body of a blog entry.

Admin users can preview blog entries before they're made publicly visible.

Screenshot
----------

This screenshot shows some example blog entries with the widgets in the left sidebar:

![Screenshot](https://raw.github.com/stefansenk/spree-blogging-spree/master/screenshot.png)


Installation
------------

Add to your Gemfile:

```ruby
gem 'spree_blogging_spree', github: 'reinteractive/spree-blogging-spree'
```

Bundle your dependencies and run the installation generator:

```shell
    bundle install
    rake railties:install:migrations
    rake db:migrate
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_blogging_spree/factories'
```

Copyright (c) 2014 Stefan Senk, released under the New BSD License
