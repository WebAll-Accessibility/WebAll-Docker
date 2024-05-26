FROM ubuntu

EXPOSE 80/tcp
EXPOSE 80/udp
EXPOSE 443/tcp
EXPOSE 443/udp
EXPOSE 8080/tcp
EXPOSE 8080/udp

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y git
RUN apt-get install -y mysql-server
RUN apt-get install systemctl
RUN apt-get install wget
RUN apt-get install -y apache2
RUN apt-get install -y php
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y php-mysql

CMD ["bash", "startup.sh"]

VOLUME /root/env
WORKDIR /root/env
