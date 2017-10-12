$nodes_count = 1

if ENV['NODES'].to_i > 0 && ENV['NODES']
  $nodes_count = ENV['NODES'].to_i
end

Vagrant.configure('2') do |config|
  config.vm.box = 'centos/7'
  config.ssh.forward_agent = true

  (1..$nodes_count).each do |i|
    config.vm.define "node#{i}" do |node|
      ip = "192.168.50.#{i+100}"
      node.vm.network "private_network", ip: ip
      ['vmware_fusion', 'vmware_workstation', 'virtualbox'].each do |provider|
        config.vm.provider provider do |_, override|
          override.ssh.host = ip
          override.ssh.port = 22
        end unless ENV['BOOT']
      end

      [ "sudo yum clean all",
        "sudo yum install -y https://yum.puppetlabs.com/puppet5/el/7/x86_64/puppet-agent-5.3.2-1.el7.x86_64.rpm",
        "sudo yum install -y make gcc ruby-devel"
      ].each do |command|
        config.vm.provision "shell", inline: command
      end
    end
  end
end
