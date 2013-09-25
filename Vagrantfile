Vagrant.configure("2") do |config|

  config.vm.define "jenkins" do |jenkins|
    #jenkins.vm.gui = false
    #jenkins.vm.name = "oml.jenkins.0"
    jenkins.vm.box = "hetzner-precise64"
    jenkins.vm.box_url = "http://vm.onmylemon.co.uk/drifter-boxes/hetzner-precise64.box"

    jenkins.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--cpus", 4]
    end

    jenkins.vm.network "public_network"
    #jenkins.vm.network "private_network", :ip => "10.0.1.10"

    jenkins.vm.provision :shell, :path => "bootstrap.sh", :args => "jenkins"
  end

#  config.vm.define "nginx" do |nginx|
#    nginx.vm.box = "hetzner-precise64"
#    nginx.vm.box_url = "http://vm.onmylemon.co.uk/drifter-boxes/hetzner-precise64.box"
#
#    nginx.vm.provider :virtualbox do |vb|
#        vb.customize ["modifyvm", :id, "--memory", 2048]
#        vb.customize ["modifyvm", :id, "--cpus", 2]
#    end
#
#    nginx.vm.network :forwarded_port, guest: 80, host: 8081
#    nginx.vm.network "private_network", ip: "10.0.1.100"
#    nginx.vm.network "public_network", ip: "188.40.241.241"
#
#    nginx.vm.provision :shell, :path => "bootstrap.sh", :args => "nginx"
#  end

  # config.vm.define "apache2" do |apache2|
  #   apache2.vm.box = "base64"
  #   apache2.vm.box_url = "http://localhost/vagrant/box/precise64.box"

  #   apache2.vm.provider :virtualbox do |vb|
  #       vb.customize ["modifyvm", :id, "--memory", 512]
  #       vb.customize ["modifyvm", :id, "--cpus", 1]
  #   end

  #   apache2.vm.hostname = "www-apache2.vagrant.lan"

  #   apache2.vm.network :forwarded_port, guest: 80, host: 8080
  #   apache2.vm.network "private_network", ip: "10.0.1.100"

  #   apache2.vm.provision :shell, :path => "bootstrap.sh", :args => "apache2"

  #   # apache2.vm.synced_folder "./files/www/", "/var/www"
  # end

#  config.vm.define "mysql" do |mysql|
#    mysql.vm.box = "hetzner-precise64"
#    mysql.vm.box_url = "http://vm.onmylemon.co.uk/drifter-boxes/hetzner-precise64.box"
#
#    mysql.vm.provider :virtualbox do |vb|
#        vb.customize ["modifyvm", :id, "--memory", 1024]
#        vb.customize ["modifyvm", :id, "--cpus", 1]
#    end
#
#    mysql.vm.network :forwarded_port, guest: 3306, host: 3306
#    mysql.vm.network "private_network", ip: "10.0.1.200"
#
#    mysql.vm.hostname = "db-mysql.vagrant.lan"
#
#    mysql.vm.provision :shell, :path => "bootstrap.sh", :args => "mysql"
#  end

end
