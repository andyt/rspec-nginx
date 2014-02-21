$:.unshift(File.expand_path('../../lib', __FILE__))

require 'rspec/nginx'

Dir[RSpec::Nginx.path('spec', 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.include RSpec::Nginx::SpecHelpers
end