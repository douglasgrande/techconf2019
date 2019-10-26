Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :mongodb03 do |mongodb03|
        mongodb03.vm.hostname = COMMON['mongodb03']['hostname']
        mongodb03.vm.network COMMON['mongodb03']['network'], 
            virtualbox__intnet: COMMON['mongodb03']['intnet'], 
            ip: COMMON['mongodb03']['ip']

        mongodb03.vm.provision "mongo-install",
            type: "shell", 
            path: "./scripts/mongo.sh"

        mongodb03.vm.provision "mongo-setup", type: "shell" do |mongosetup|
            mongosetup.path = "./scripts/mongo-setup.sh"
            mongosetup.args = [COMMON['mongodb03']['ip']]
        end

        mongodb03.vm.provision "host-setup", type: "shell" do |hostsetup|
            hostsetup.path = "./scripts/host-setup.sh"
            hostsetup.args = [COMMON['mongodb01']['ip'], COMMON['mongodb01']['hostname'], 
            COMMON['mongodb02']['ip'], COMMON['mongodb02']['hostname'],
            COMMON['mongodb03']['ip'], COMMON['mongodb03']['hostname']]
        end
    end
end