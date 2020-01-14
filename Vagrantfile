# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  NodeCount = 3

  # Veeam PoC Nodes
  (1..NodeCount).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "node#{i}.example.com"
      node.vm.network "public_network", ip: "192.168.1.24#{i}", bridge: "wlp1s0"
      node.vm.provider "virtualbox" do |v|
        v.name = "node#{i}"
        v.memory = 1024
        v.cpus = 1
      end
      node.vm.provision "shell", path: "bootstrap_apps.sh"
    end
  end

end