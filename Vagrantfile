Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 8099, host: 8099 
  
  config.vm.synced_folder "./", "/isodenv"
  config.vm.synced_folder "./configs", "/configs"  
  config.vm.synced_folder "../", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "isodenv"
    vb.memory = "2048"
  end
  
  config.vm.provision "ansible" do |ansible|
        ansible.playbook = "./provision/playbook.yml"
  end

  config.vm.provision "shell",
    inline: 'service gigaspaces deploy', run: "always", privileged: false
end
