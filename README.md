#Creating a Jenkins/Ansible Lab on MacOS
If you want to test Jenkins CI/CD together with Ansible and Docker on MacOS, please clone this project run it with docker-compose

#Jenkins
There is a directory mapping for Jenkins configuration files (`jenkins_home`).
Jenkins credentials are: admin/1234
Jenkins also configured to find Docker http/api at 192.168.1.134 IP address. To allow Jenkins communicate with Docker running on your MacOS, you have to change `Docker plugin` inside Jenkins to use your hosts IP address or simply change/add your MacOS ip to 192.168.1.134.

#socat
For security reasons, docker-http port is not published on MacOS. However, using the `socat image` provided with the docker-compose.yml file, it is possible to create a listening port on localhost:2375 (you may change this mapping inside `docker-compose.yml` file).
You will be alerted to run `export DOCKER_HOST=tcp://127.0.0.1:2375` on your MacOS. access docker This is important, otherwise you personally and Jenkins as well cannot access docker api.

#Ansible
Ansible and Jenkins are pre-configured with ssh-keys to allow them to communicate.
