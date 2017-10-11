# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
host_vm_dir = File.dirname(File.expand_path(__FILE__))
vconfig = YAML.load_file("#{host_vm_dir}/config.yml")

# Cross-platform way of finding an executable in the $PATH.
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each do |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    end
  end
  nil
end

Vagrant.configure('2') do |config|
  config.vm.define :dev do |dev_config|
    dev_config.ssh.forward_agent = true
    dev_config.ssh.insert_key = false

    dev_config.vm.box         = 'ubuntu/trusty64'
    dev_config.vm.hostname    = 'manativm'
    config.hostsupdater.aliases = vconfig['hostsupdater_aliases']

    # VirtualBox specific configuration.
    dev_config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', vconfig['vm_ram'] || '2048']
      vb.customize ['modifyvm', :id, '--cpus', vconfig['vm_cpus'] || '2']
      vb.customize ['modifyvm', :id, '--name', 'Manati Box Trusty']
    end

    # Shared folders through NFS. This is supported in Mac and Linux. Windows may have
    # issues, see Vagrant site for documentation.
    dev_config.vm.network :private_network, ip: '10.10.10.10'
    options = {
      type: 'nfs',
      create: true
    }
    dev_config.vm.synced_folder vconfig['synced_folder_path'] || '../www', '/home/vagrant/www', options

    # Provisioning. Use ansible if it's installed, JJG-Ansible-Windows if not.
    if which('ansible-playbook')
      dev_config.vm.provision 'ansible' do |ansible|
        ansible.playbook = './provisioning/playbook.yml'
      end
    else
      dev_config.vm.provision 'shell' do |sh|
        sh.path = './provisioning/JJG-Ansible-Windows/windows.sh'
        sh.args = '-e ./provisioning/playbook.yml'
      end
    end
  end
end
