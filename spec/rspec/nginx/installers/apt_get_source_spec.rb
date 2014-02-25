require 'spec_helper'

module RSpec::Nginx::Installers
  describe AptGetSource do
    describe '.version' do
      it 'should be the current nginx version' do
        expect(AptGetSource.version).to eq '1.1.19'
      end
    end
  end
end