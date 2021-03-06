FROM nginx


RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install netcat -y
RUN apt-get install vim -y
RUN apt-get install httpie -y
RUN apt-get install dnsutils -y


COPY default.conf /etc/nginx/nginx.conf
RUN  mkdir  /usr/share/nginx/pong/
RUN mkdir /var/cache/nginx/client_temp
COPY pong.htm /usr/share/nginx/pong/pong.htm
#USER 1337:1337