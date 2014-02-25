module RSpec::Nginx

  # Encapsulates an instance of an Nginx binary
  class Instance
    attr :binary_path, :config_path, :pid

    def initialize(binary_path, config_path)
      @binary_path, @config_path = binary_path, config_path
    end

    def start
      @pid = fork do
        exec("%s -c %s -p %s" % [binary_path, config_path, prefix])
      end
      teardown
    end

    def teardown
      Kernel.at_exit { Process.kill(15, @pid); Process.wait }
    end

    def prefix
      File.dirname(config_path)
    end

    def running?
      Process.getpgid(pid)
      true
    rescue Errno::ESRCH
      false
    end
  end
end

