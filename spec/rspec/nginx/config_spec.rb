require 'spec_helper'

module RSpec::Nginx
  describe Config do
    let(:config) { Config.new fixture('simple-vhost-no-logs', 'nginx.conf') }

    describe '#transformed_content' do
      before { config.transformed_content }

      it 'should gsub listen directives' do
        expect(config.transformed_content).to include 'listen 127.0.0.1:8500'
      end

      it 'should populate #listen_directives' do
        expect(config.listen_directives).to eq ['listen 80']
      end

      it 'should populate #listen_replacements' do
        expect(config.listen_replacements).to eq ['127.0.0.1:8500']
      end
    end
  end
end