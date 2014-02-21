require 'open3'

module RSpec::Nginx
  class Binary
    attr :binary_path

    def initialize(binary_path)
      @binary_path = binary_path
    end

    def test(config_path)
      stdin, stdout, stderr = Open3.popen3("%s -t -c %s" % [binary_path, config_path])
      stderr.readlines
    end

    def valid_syntax?(config_path)
      !!test(config_path).detect { |line| line =~ /syntax is ok/ }
    end
  end
end