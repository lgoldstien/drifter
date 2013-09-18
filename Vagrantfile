Vagrant.configure("2") do |config|

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "base64"
    jenkins.vm.box_url = "http://files.vagrantup.com/precise64.box"

    jenkins.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--cpus", 2]
    end

    jenkins.vm.network :forwarded_port, guest: 8080, host: 8080
    jenkins.vm.network "private_network", ip: "10.0.1.10"

    jenkins.vm.provision :shell do |s|
      s.path = "vagrant-scripts/bootstrap.sh"
      s.path = "vagrant-scripts/bootstrap-jenkins.sh"
    end
  end

  config.vm.define "www" do |www|
    www.vm.box = "base64"
    www.vm.box_url = "http://files.vagrantup.com/precise64.box"

    www.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 512]
        vb.customize ["modifyvm", :id, "--cpus", 1]
    end

    www.vm.network :forwarded_port, guest: 80, host: 80
    www.vm.network "private_network", ip: "10.0.1.100"

    www.vm.provision :shell do |s|
      s.path = "vagrant-scripts/bootstrap.sh"
      s.path = "vagrant-scripts/bootstrap-www.sh"
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "base64"
    db.vm.box_url = "http://files.vagrantup.com/precise64.box"

    db.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 512]
        vb.customize ["modifyvm", :id, "--cpus", 1]
    end

    db.vm.network :forwarded_port, guest: 3306, host: 3306
    db.vm.network "private_network", ip: "10.0.1.200"

    db.vm.provision :shell do |s|
      s.path = "vagrant-scripts/bootstrap.sh"
      s.path = "vagrant-scripts/bootstrap-mysql.sh"
    end
  end

end
