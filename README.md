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


2. Go to the project's main folder docker-up:

    - Build (or rebuild) the docker image: 

            make build

      This will pull in a 200MB ubuntu VM image, and install all packages.

    - Run the dev container:

            make rundev


3.  Shell-into the container:

        make shell

    Once inside the container, go to project dir and run the django development server:

        root@NNNN cd /var/projects/djproject/
        root@NNNN ./manage syncdb
        root@NNNN ./manage.py runserver 0.0.0.0:8000   

    You should be able to edit the files on your mac, 
    and watch the django server auto-reload.


4. To see the site in action:

        make show

    This will find the docker-vm's IP and connect to port 8000 on it.


    
    

Running prod environment
------------------------

0. Obtain AWS credentials 
   - EC2 key (for ssh-ing into machines)
   - aws_access_key_id and aws_secret_access_key

1. Install `eb` command line tool

2. Associate repo with elastic beanstalk

        eb init

3. Check if an evnironment exists:

        eb list
    
    if not create it
    
        eb create

4. Deploy

    eb deploy


5. To stop all instances run: 

    eb terminate


Note: The `eb` command line uses AWS settings in  `~/.aws/config` 


To check "cluster" status:

    eb status


