FROM ubuntu

EXPOSE 80
EXPOSE 443
EXPOSE 8080

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y git
RUN apt-get install -y mysql-server
RUN apt-get install systemctl
RUN apt-get install wget

CMD ["bash", "startup.sh"]

VOLUME /root/env
WORKDIR /root/env
