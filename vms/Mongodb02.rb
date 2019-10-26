Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :mongodb02 do |mongodb02|
        mongodb02.vm.hostname = COMMON['mongodb02']['hostname']
        mongodb02.vm.network COMMON['mongodb02']['network'], 
            virtualbox__intnet: COMMON['mongodb02']['intnet'], 
            ip: COMMON['mongodb02']['ip']

        mongodb02.vm.provision "mongo-install",
            type: "shell", 
            path: "./scripts/mongo.sh"

        mongodb02.vm.provision "mongo-setup", type: "shell" do |mongosetup|
            mongosetup.path = "./scripts/mongo-setup.sh"
            mongosetup.args = [[COMMON['mongodb01']['ip']]
        end

        mongodb02.vm.provision "host-setup", type: "shell" do |hostsetup|
            mongosetup.path = "./scripts/mongo-setup.sh"
            mongosetup.args = [COMMON['mongodb01']['ip'], COMMON['mongodb01']['hostname'], 
            COMMON['mongodb02']['ip'], COMMON['mongodb02']['hostname'],
            COMMON['mongodb03']['ip'], COMMON['mongodb03']['hostname']]
        end
    end
end