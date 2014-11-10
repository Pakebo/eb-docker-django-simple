
Installation instructions
=========================


1. Install boot2docker 
    - Get the installer 
        https://github.com/boot2docker/osx-installer/releases (130MB)

    - Run the commands
        boot2docker init
        boot2docker start
        $(boot2docker shellinit)


2. Clone the sample app repo (this)

    git clone git@github.com:Pakebo/eb-docker-django-simple.git
    cd eb-docker-django-simple

3. Build the container image (here called `test-img-1`)

    docker build -t test-img-1 .

This will pull in a 200MB ubuntu VM image, and install all packages.


4. Run a container called `web` based on the `test-img-1`:

    docker run -d -p 8080:80 --name web    test-img-1

5. See the running app:

    open http://$(boot2docker ip 2>/dev/null):8080
    



Debugging
---------


To obtain an interactive shell inside the container, run the command:

    docker exec -i -t web /bin/bash

To check services running:

    root@nnnn:/# supervisorctl status

which should display:

    nginx                            RUNNING    pid 12, uptime 0:17:39
    webapp                           RUNNING    pid 13, uptime 0:17:39














