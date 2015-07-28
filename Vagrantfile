Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8099, host: 8099 

  config.vm.synced_folder "%ISODENV%", "/isodenv"
  config.vm.synced_folder "%CONFIGS%", "/configs"  

  config.vm.provider "virtualbox" do |vb|
    vb.name = "isodenv"
    vb.memory = "2048"
  end
  
  config.vm.provision "ansible" do |ansible|
        ansible.playbook = "%ISODENV%/provision/playbook.yml"
  end
end
