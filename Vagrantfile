# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {
  'postgres-pub' => {'memory' => '1024', 'cpus' => 1, 'ip' => '10'},
  'postgres-sub' => {'memory' => '1024', 'cpus' => 2, 'ip' => '20'},
}

Vagrant.configure('2') do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |m|
      m.vm.hostname = "#{name}.local"
      m.vm.network 'private_network', ip: "192.168.1.#{conf['ip']}"

      m.vm.provider 'virtualbox' do |vb| # VirtualBox
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
      end
      m.vm.provider 'libvirt' do |lv| # Libvirt
        lv.memory = conf['memory']
        lv.cpus = conf['cpus']
        lv.cputopology :sockets => 1, :cores => conf['cpus'], :threads => '1'
      end
      m.vm.synced_folder ".", "/vagrant", type: "nfs",  nfs_udp: false
      m.vm.provision  "shell", path: "provision.sh"

    end

  end
  config.vbguest.auto_update = false
end