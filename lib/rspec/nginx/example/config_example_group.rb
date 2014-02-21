RSpec.configure do |c|
  c.add_setting :nginx_path, :default => '/usr/sbin/nginx'
  c.add_setting :document_root, :default => RSpec::Nginx.path('docroot')
  c.add_setting :server_template, :default => RSpec::Nginx.path('templates', 'server.conf')
end

module RSpec::Nginx
  module ConfigExampleGroup

    RSpec.configure do |c|
      c.include self, :type => :nginx_config
    end

    module ClassMethods
    end

    module ExampleMethods
    end

    def self.included(base)
      base.instance_eval do
        include ExampleMethods

        before do
        end

        subject do
          Config.new(example.metadata[:example_group][:description], :binary => Binary.new(RSpec.configuration.nginx_path))
        end
      end
    end
  end
end