eb-docker-django-simple
=======================

A simple Django application working in a docker container and deployable to AWS Elastic Beanstalk


Prerquisites
------------

See `INSTALL.md` in this directory.


Running dev environment
-----------------------

Assuming boot2docker is installed and `init`-ed:

1. Start VM  

        boot2docker start
        $(boot2docker shellinit)


2. Go to the project's main folder and run

    2.1 Build (or rebuild) the docker image: 

            make build

        This will pull in a 200MB ubuntu VM image, and install all packages.

    2.2 Run the dev container:

            make rundev


3.  Shell-into the container:

        make shell

    Once inside the container, go to project dir and run the django development server:

        root@NNNN cd /var/projects/djproject/
        root@NNNN ./manage.py runserver 0.0.0.0:8000   

    
You should be able to edit the files on your mac, 
and watch the django server auto-reload.


4. To see the site in action:

        make show

    This will find the docker-vm's IP and connect to port 8000 on it.


    













