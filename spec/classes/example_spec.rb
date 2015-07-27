require 'spec_helper'

describe 'etckeeper' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "etckeeper class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('etckeeper::params') }
          it { is_expected.to contain_class('etckeeper::install').that_comes_before('etckeeper::config') }
          it { is_expected.to contain_class('etckeeper::config') }

          it { is_expected.to contain_package('etckeeper').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'etckeeper class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('etckeeper') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
