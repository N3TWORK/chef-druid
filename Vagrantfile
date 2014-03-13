# -*- mode: ruby -*-
# vi: set ft=ruby :

box = ENV['VAGRANT_BOX'] || 'opscode_ubuntu-12.04_provisionerless'
Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Prevent the "stdin: is not a tty" warning
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box = box
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/#{box}.box"
  config.omnibus.chef_version = :latest

  config.vm.provision :shell do |shell|
    shell.inline = 'test -f $1 || (apt-get update -y && touch $1)'
    shell.args = '/var/run/apt-get-update'
  end

  config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && mysql -e 'create database druid'"

  cookbook_name = File.basename(File.expand_path(File.dirname(__FILE__)))
  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ".."
    chef.run_list = [
        "recipe[#{cookbook_name}::coordinator]",
        "recipe[#{cookbook_name}::overlord]",
        "recipe[#{cookbook_name}::middleManager]",
        "recipe[#{cookbook_name}::broker]",
        "recipe[#{cookbook_name}::historical]"
    ]

    #config.vm.network "forwarded_port", guest: 9092, host: 9092

    chef.json = {
        "druid" => {
            "properties" => {
                "druid.db.connector.connectURI" => "jdbc:mysql://127.0.0.1:3306/druid",
                "druid.db.connector.user" => "root",
                "druid.db.connector.password" => "",
                "druid.zk.service.host" => "127.0.0.1:2181",
                "druid.extensions.coordinates" => "[\"io.druid.extensions:druid-s3-extensions:0.6.52\", \"io.druid.extensions:druid-kafka-eight:0.6.52\"]"
            }
        }
    }
  end
end
