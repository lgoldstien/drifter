Vagrant.configure("2") do |config|

  # config.vm.define "jenkins" do |jenkins|
  #   jenkins.vm.box = "base64"
  #   jenkins.vm.box_url = "http://files.vagrantup.com/precise64.box"

  #   jenkins.vm.provider :virtualbox do |vb|
  #       vb.customize ["modifyvm", :id, "--memory", 1024]
  #       vb.customize ["modifyvm", :id, "--cpus", 2]
  #   end

  #   jenkins.vm.network :forwarded_port, guest: 8080, host: 8080
  #   jenkins.vm.network "private_network", ip: "10.0.1.10"

  #   jenkins.vm.provision :shell do |s|
  #     s.path = "vagrant-scripts/bootstrap.sh jenkins"
  #   end
  # end

  # config.vm.define "nginx" do |nginx|
  #   nginx.vm.box = "base64"
  #   nginx.vm.box_url = "http://files.vagrantup.com/precise64.box"

  #   nginx.vm.provider :virtualbox do |vb|
  #       vb.customize ["modifyvm", :id, "--memory", 512]
  #       vb.customize ["modifyvm", :id, "--cpus", 1]
  #   end

  #   nginx.vm.network :forwarded_port, guest: 80, host: 80
  #   nginx.vm.network "private_network", ip: "10.0.1.100"

  #   nginx.vm.provision :shell do |s|
  #     s.path = "vagrant-scripts/bootstrap.sh nginx"
  #   end
  # end

  config.vm.define "apache2" do |apache2|
    apache2.vm.box = "base64"
    apache2.vm.box_url = "/vagrant/box/precise64.box"

    apache2.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 512]
        vb.customize ["modifyvm", :id, "--cpus", 1]
    end

    apache2.vm.hostname = "www-apache2.vagrant.lan"
    
    apache2.vm.network :forwarded_port, guest: 80, host: 8080
    apache2.vm.network "private_network", ip: "10.0.1.100"

    apache2.vm.synced_folder "./www/", "/var/www"

    apache2.vm.provision :shell, :path => "bootstrap.sh", :args => "apache2"
  end

  config.vm.define "mysql" do |mysql|
    mysql.vm.box = "base64"
    mysql.vm.box_url = "http://localhost/vagrant/box/precise64.box"

    mysql.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 512]
        vb.customize ["modifyvm", :id, "--cpus", 1]
    end

    mysql.vm.network :forwarded_port, guest: 3306, host: 13306
    mysql.vm.network "private_network", ip: "10.0.1.200"

    mysql.vm.hostname = "db-mysql.vagrant.lan"

    mysql.vm.provision :shell, :path => "bootstrap.sh", :args => "mysql"
  end

end
