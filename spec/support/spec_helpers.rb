module RSpec::Nginx
  module SpecHelpers
    def fixture(*subpaths)
      RSpec::Nginx.path('spec', 'nginx', *subpaths)
    end
  end
end