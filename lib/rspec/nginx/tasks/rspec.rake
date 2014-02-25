require 'rspec/nginx'
require 'rspec/core/rake_task'

namespace :nginx do
  namespace :install do
    desc "Install nginx-#{RSpec::Nginx::Installers::AptGetSource.version} from source using apt-get source."
    task :apt_get_source do
      RSpec::Nginx::Installers::AptGetSource.new.install!
    end
  end

  task :spec => :'spec:nginx'
end

namespace :spec do
  RSpec::Core::RakeTask.new(:nginx) do |t|
    t.pattern = "spec/nginx/**/*_spec.rb"
  end
end