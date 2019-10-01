FROM ubuntu:16.04

RUN apt-get -y upgrade
RUN apt-get -y install php7.0-fpm php7.0-mysql php7.0-gd php7.0-cli nginx 

RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/
#ADD mime.types /etc/nginx/

RUN mkdir -p /opt/projects
ADD projects /opt/projects

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Expose ports.
EXPOSE 80

CMD ["nginx"]

# Command 
# sudo docker build -t hello-nginx .
# sudo docker run --name docker-nginx -p 8080:80 hello-nginx