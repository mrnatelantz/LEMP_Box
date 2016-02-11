# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "natelantz.com-vagrant"
  config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

  ## Provisioning scripts
  # Remove or add whatever you want
  # Each script has a single purpose
  config.vm.provision :shell, path: "scripts/php7-fpm.sh"
  config.vm.provision :shell, path: "scripts/composer.sh"
  config.vm.provision :shell, path: "scripts/phpunit.sh"
  config.vm.provision :shell, path: "scripts/mysql.sh"
  config.vm.provision :shell, path: "scripts/nginx.sh"
  config.vm.provision :shell, path: "scripts/node.sh"

  config.vm.provider "virtualbox" do |vb|

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end
  
end
