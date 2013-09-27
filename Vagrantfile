Vagrant.configure("2") do |config|

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "hetzner-precise64"
    nginx.vm.box_url = "http://vm.onmylemon.co.uk/drifter-boxes/hetzner-precise64.box"

    nginx.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--cpus", 2]
    end

    #nginx.vm.network :forwarded_port, guest: 80, host: 8081
    nginx.vm.network "private_network", ip: "10.0.1.100", :auto_config => false
    nginx.vm.network "public_network", :auto_config => false

    nginx.vm.provision :shell, :path => "bootstrap.sh", :args => "nginx"
  end

end
