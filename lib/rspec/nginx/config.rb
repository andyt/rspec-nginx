module RSpec::Nginx
  class Config
    attr :path, :binary

    def initialize(path, options = {})
      @path = path
      @binary = options.delete(:binary)
    end

    def has_valid_syntax?
      binary.valid_syntax?(self.path)
    end
  end
end