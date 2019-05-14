FROM ubuntu

RUN apt update
RUN apt upgrade -y
RUN apt install inetutils-ping -y
RUN apt install net-tools -y
RUN apt install dnsutils -y
RUN apt install default-jre -y
RUN apt install openssh-server -y
RUN apt install vim -y

ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"

# SSH Server Containerization
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:Tyrion2019Denarys' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
