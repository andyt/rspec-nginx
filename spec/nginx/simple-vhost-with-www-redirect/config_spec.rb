require 'spec_helper'

describe 'simple-vhost-with-www-redirect' do
  describe 'nginx.conf', :type => :nginx_config do
    it { should have_valid_syntax }
    #it { should speak_http_on 'www.example.com' }
  end
end