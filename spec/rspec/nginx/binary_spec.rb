require 'spec_helper'

module RSpec::Nginx
  describe Binary do
    let(:binary) { Binary.new(RSpec.configuration.nginx_path) }

    describe '#valid_syntax?' do
      let(:config) { fixture('simple-vhost-no-logs', 'nginx.conf') }
      it 'should be true' do
        expect(binary.valid_syntax?(config)).to eq true
      end
    end


    describe '#test' do
      context 'with valid config' do
        let(:config) { fixture('simple-vhost-no-logs', 'nginx.conf') }
        it 'should return an empty array', :pending => true do
          expect(binary.test(config)).to eq []
        end
      end

      context 'with invalid config' do
        let(:config) { fixture('simple-vhost-with-www-redirect', 'nginx.conf') }
        it 'should return stderr' do
          expect(binary.test(config)).not_to eq []
        end
      end
    end

  end
end