require 'spec_helper'

describe package('apache2') do
  it { should be_installed }
end

describe package('postgresql') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe service('renderd') do
  it { should be_enabled }
  it { should be_running }
end

describe service('postgresql') do
  it { should be_enabled }
  it { should be_running }
end

describe command('apachectl -M') do
  its(:stdout) { should contain('tile_module') }
end

describe command('curl --dump-header - --head http://localhost/map/0/0/0.png'), :sudo => false do
  its(:stdout) { should contain('200 OK') }
  its(:stdout) { should contain('Content-Type: image/png') }
end

describe port(80) do
  it { should be_listening }
end
