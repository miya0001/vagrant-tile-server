# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.8.6'

_conf = YAML.load(
  File.open(
    File.join(File.dirname(__FILE__), 'provision/defaults.yml'),
    File::RDONLY
  ).read
)

if File.exists?(File.join(File.dirname(__FILE__), 'config.yml'))
  _site = YAML.load(
    File.open(
      File.join(File.dirname(__FILE__), 'config.yml'),
      File::RDONLY
    ).read
  )
  _conf.merge!(_site) if _site.is_a?(Hash)
end

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_check_update = true

  if Vagrant.has_plugin?('vagrant-hostsupdater')
    config.vm.hostname = _conf['hostname']
  end

  config.vm.network :private_network, ip: _conf['ip']
  config.vm.define _conf['hostname'] do |v|
  end

  if Vagrant.has_plugin?('vagrant-hostsupdater')
    config.hostsupdater.remove_on_suspend = true
  end


  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.provider :virtualbox do |vb|
    vb.linked_clone = false
    vb.name = _conf['hostname']
    vb.memory = _conf['hostname']
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.extra_vars = _conf
    ansible.playbook = "provision/playbook.yml"
  end

  if File.exists?(File.join(File.dirname(__FILE__), 'provision-post.sh')) then
    config.vm.provision :shell, :privileged => false, :path => File.join( File.dirname(__FILE__), 'provision-post.sh' )
  end
end
