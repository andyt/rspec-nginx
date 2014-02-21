require 'spec_helper'

module RSpec
  describe Nginx do
    describe '.path' do
      it 'should return a subpath below the root' do
        expect(Nginx.path('path', 'to', 'file')).to eq File.expand_path('../../../path/to/file', __FILE__)
      end
    end
  end
end