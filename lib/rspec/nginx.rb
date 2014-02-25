require 'rspec/core'
require 'rspec/nginx/version'

RSpec::configure do |c|
  # c.backtrace_exclusion_patterns << /vendor\//
  # c.backtrace_exclusion_patterns << /lib\/rspec\/nginx/
end

module RSpec
  module Nginx

    def self.root
      File.expand_path '../../..', __FILE__
    end

    def self.path(*subpaths)
      File.join(root, *subpaths)
    end
  end
end

require 'rspec/nginx/example'
require 'rspec/nginx/installers'
require 'rspec/nginx/config'
require 'rspec/nginx/binary'
require 'rspec/nginx/instance'

if defined?(Rake)
  load 'rspec/nginx/tasks/rspec.rake'
end