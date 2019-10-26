Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :mongodb01 do |mongodb01|
        mongodb01.vm.hostname = COMMON['mongodb01']['hostname']
        mongodb01.vm.network COMMON['mongodb01']['network'], 
            virtualbox__intnet: COMMON['mongodb01']['intnet'], 
            ip: COMMON['mongodb01']['ip']

        mongodb01.vm.provision "mongo-install",
            type: "shell", 
            path: "./scripts/mongo.sh"
        
        mongodb01.vm.provision "mongo-setup", type: "shell" do |mongosetup|
            mongosetup.path = "./scripts/mongo-setup.sh"
            mongosetup.args = [COMMON['mongodb01']['ip']]
        end
        
        mongodb01.vm.provision "host-setup", type: "shell" do |hostsetup|
            hostsetup.path = "./scripts/host-setup.sh"
            hostsetup.args = [COMMON['mongodb01']['ip'], COMMON['mongodb01']['hostname'], 
            COMMON['mongodb02']['ip'], COMMON['mongodb02']['hostname'],
            COMMON['mongodb03']['ip'], COMMON['mongodb03']['hostname']]
        end

        mongodb01.vm.provision "mongo-add",
            type: "shell", 
            path: "./scripts/mongo-add.sh"
    end
end