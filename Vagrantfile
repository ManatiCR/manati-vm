# -*- mode: ruby -*-
# vi: set ft=ruby :
host_vm_dir = File.dirname(File.expand_path(__FILE__))
vconfig = YAML.load_file("#{host_vm_dir}/config.yml")

Vagrant.configure("2") do |config|
  config.vm.define :dev do |dev_config|

    dev_config.ssh.forward_agent = true
    dev_config.ssh.insert_key = false

    dev_config.vm.box         = "ubuntu/trusty64"
    dev_config.vm.hostname    = "manativm"
    config.hostsupdater.aliases = vconfig['hostsupdater_aliases']

    # VirtualBox specific configuration.
    dev_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--name", "Manati Box Trusty"]
    end

    # Shared folders through NFS. This is supported in Mac and Linux. Windows may have
    # issues, see Vagrant site for documentation.
    dev_config.vm.network :private_network, ip: "10.10.10.10"
    dev_config.vm.synced_folder "../www", "/home/vagrant/www",
      type: "nfs", create: true

    dev_config.vm.provision "ansible" do |ansible|
      ansible.playbook = "./provisioning/playbook.yml"
    end
  end
end
