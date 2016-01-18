VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "main"

    config.vm.box = "ubuntu/trusty64"

    config.vm.network :forwarded_port, guest: 8080, host: 8080

    config.vm.provision "shell", inline: "mkdir -p /tmp/hippo-distributions"
    config.vm.provision "shell", inline: "sudo chown vagrant.vagrant /tmp/hippo-distributions"
    config.vm.provision "shell", inline: "wget -nc https://github.com/daniel-rhoades/hippo-gogreen/releases/download/v0.1/gogreen-0.1.0-SNAPSHOT-distribution.tar.gz -q -O /tmp/hippo-distributions/gogreen-0.1.0-SNAPSHOT-distribution.tar.gz"

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end

    config.vm.provision "docker" do |d|
        d.run "mysql:latest", args: "--name gogreen-mysql --volume /vagrant/tests/database-init-scripts:/docker-entrypoint-initdb.d:ro -e MYSQL_ROOT_PASSWORD=password -d"

        d.build_image "/vagrant/", args: "-t hippo-tomcat_trusty -f /vagrant/tests/Dockerfile-ubuntu14.04"

        d.run "hippo-tomcat_trusty", args: "-p 8080:8080 --volume /tmp/hippo-distributions:/opt/cms/distributions:ro --link gogreen-mysql:mysql -e HIPPO_CONTENTSTORE_USERNAME=\"gogreen\" -e HIPPO_CONTENTSTORE_PASSWORD=\"password\" -e HIPPO_CONTENTSTORE_URL=\"jdbc:mysql://\\$MYSQL_PORT_3306_TCP_ADDR:\\$MYSQL_PORT_3306_TCP_PORT/gogreen?characterEncoding=utf8\""
    end
end