require 'serverspec'
require 'net/ssh'
require 'tempfile'

set :backend, :ssh

host = "map.dev"

config = Tempfile.new('', Dir.tmpdir)
`unset RUBYLIB; vagrant ssh-config #{host} > #{config.path}`

options = Net::SSH::Config.for(host, [config.path])
puts options.to_s
set :host,        host
set :ssh_options, options
