# Rspec::Nginx

Use TDD to build your NginX config files feature by feature, or write regression tests to help you refactor your config-monsters.


## Installation

You'll need Ruby and bundler.

Add this line to a Gemfile in your project folder:

    gem 'rspec-nginx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-nginx


## Usage

    require 'rspec/nginx'

    describe 'simple-vhost-with-www-redirect' do
      describe 'nginx.conf', :type => :nginx_config do
        it { should have_valid_syntax }
      end
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
