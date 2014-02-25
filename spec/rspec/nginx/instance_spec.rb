require 'spec_helper'

module RSpec::Nginx
  describe Instance do
    let(:binary_path) { RSpec.configuration.nginx_path }
    let(:config_path) { Config.new(fixture('simple-vhost-no-logs', 'nginx.conf')).transformed_path }
    let(:instance)    { Instance.new(binary_path, config_path) }

    describe '#start' do
      it 'should start, set @pid, be running and call teardown' do
        expect(instance).to receive(:teardown).and_call_original

        instance.start

        expect(instance.pid).not_to be nil
        expect(instance.running?).to be true
      end
    end
  end
end