FROM ubuntu:14.04
MAINTAINER Ivan Savov <ivan.savov@gmail.com>

##############################################################################
# base 
##############################################################################
# setup basic ENV 
ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen  en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# update OS
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

##############################################################################
# Install system python
##############################################################################
RUN apt-get install -y python python-pip vim wget 


##############################################################################
# install and setup NGINX
##############################################################################
RUN apt-get -y install nginx
ADD ./deploy/webapp.nginxconf /etc/nginx/sites-available/webapp.nginxconf
RUN ln -s /etc/nginx/sites-available/webapp.nginxconf /etc/nginx/sites-enabled/webapp.nginxconf


##############################################################################
# setup startup script for gunicord WSGI service 
##############################################################################
RUN groupadd webapps
RUN useradd webapp -G webapps
RUN mkdir -p /var/log/webapp/ && chmod 777 /var/log/webapp/
RUN mkdir -p /var/run/webapp/ && chmod 777 /var/run/webapp/


##############################################################################
# Install and configure supervisord
##############################################################################
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
RUN rm /etc/nginx/sites-enabled/default
ADD ./deploy/supervisor_conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD ./deploy/supervisor_conf.d/webapp.conf /etc/supervisor/conf.d/webapp.conf


##############################################################################
# add source code repos and build
##############################################################################
ADD ./djproject      /var/projects/djproject
# NB: this directive is not used in DEV: the docker volume overwrites /var/projects/djproject

# installing python prereqs...
RUN cd /var/projects/djproject && pip install -r requirements.txt
#RUN cd /var/projects/djproject && \
#    ./manage.py syncdb --noinput && \
#    ./manage.py loaddata backend/admin_account_fixture.json && \
#    ./manage.py collectstatic --noinput


# run 
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

# expose port 80 
EXPOSE 80








