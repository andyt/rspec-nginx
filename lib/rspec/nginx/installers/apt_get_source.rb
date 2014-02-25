module RSpec::Nginx::Installers
  class AptGetSource
    def self.version
      `$(which nginx) -v 2>&1`.strip.split('/')[1]
    end

    def install!
      puts command
      system(command) || raise(RuntimeError, 'Install failed.')
      puts "nginx binary installed at %s" % nginx_path
    end

    def nginx_path
      '%s/sbin/nginx' % prefix
    end

    def command
      command = <<-CMD
        mkdir -p #{src} && 
        cd #{src} && 
        apt-get source nginx && 
        cd nginx-#{version} && 
        ./configure --prefix=#{prefix} --user=#{user} && 
        make && 
        make install
      CMD
    end

    def src
      '%s/.rspec-nginx/src' % home
    end

    def version
      self.class.version
    end

    def prefix
      '%s/.rspec-nginx/bin/nginx-%s' % [home, version]
    end

    def home
      ENV['HOME'] || raise(RuntimeError, '$HOME not set!')
    end

    def user
      `whoami`.strip
    end
  end
end