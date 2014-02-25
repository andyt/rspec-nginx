module RSpec::Nginx
  class Config
    attr :path, :binary

    BASE_PORT = 8500

    def initialize(path, options = {})
      @path = path
      @binary = options.delete(:binary)
    end

    def has_valid_syntax?
      binary.valid_syntax?(self.path)
    end

    def content
      @content ||= File.read(path)
    end

    def transformed_content
      @transformed_content ||=
        File.readlines(path).inject([]) do |transformed, line|
          if matches = line.match(/^\s*(listen\s*(.*));\s*$/)
            listen_directives << matches[1]
            listen_replacements << '127.0.0.1:%s' % (BASE_PORT + listen_replacements.size)
            transformed << line.gsub(matches[2], listen_replacements.last)
          else
            transformed << line
          end
        end.join
    end

    def transformed_path
      @transformed_path ||= begin
        (path + '.transformed').tap do |path|
          File.open(path, 'w') do |f|
            f.puts transformed_content
          end
        end
      end
    end

    def listen_directives
      @listen_directives ||= []
    end

    def listen_replacements
      @listen_replacements ||= []
    end
  end
end