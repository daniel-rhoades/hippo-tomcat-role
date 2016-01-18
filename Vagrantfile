VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "main"

    config.vm.box = "ubuntu/trusty64"

    config.vm.network :forwarded_port, guest: 8080, host: 8080

    config.vm.provision "docker" do |d|
        d.run "mysql:latest", args: "--name gogreen-mysql -e MYSQL_ROOT_PASSWORD=password -d"

        config.vm.provision "ansible" do |a|
            a.playbook = "tests/setup-test-dependencies.yml"
        end
    end

    config.vm.provision "docker" do |d|
        #d.build_image "/vagrant/", args: "-t hippo-tomcat_trusty -f /vagrant/tests/Dockerfile-ubuntu14.04"
        d.run "hippo-tomcat_trusty", args: "-p 8080:8080 --volume /tmp/hippo-distributions:/opt/cms/distributions:ro --link gogreen-mysql:mysql -e HIPPO_CONTENTSTORE_USERNAME=\"gogreen\" -e HIPPO_CONTENTSTORE_PASSWORD=\"password\" -e HIPPO_CONTENTSTORE_URL=\"jdbc:mysql://\$MYSQL_PORT_3306_TCP_ADDR:\$MYSQL_PORT_3306_TCP_PORT/gogreen?characterEncoding=utf8\""
    end
end