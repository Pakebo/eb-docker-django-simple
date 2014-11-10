
help:
	@echo Helper functions for making/managing docker images and containers
	@echo     docker ps		: shows running containers
	@echo     make build    : builds test-img-1 docker image   = a filesystem snapshot
	@echo     make run_dev  : starts a container named  webdev  from image  test-img-1
	@echo     make shell    : shell into container

build: 
	docker build -t test-img-1 .





# DEVELOPMENT CONTAINER 
start:
	#@echo run    boot2docker start
	#@echo run    $(boot2docker shellinit)
rundev:
	docker run -d -p 8000:8000 \
           -v $(CURDIR)/djproject:/var/projects/djproject \
           --name webdev   test-img-1
	docker exec -t webdev  /usr/bin/supervisorctl stop webapp 
	docker ps
	@echo Container webdev started
shell:
	@echo Run /var/projects/djproject/manage.py runserver 0.0.0.0:8000   to start django dev server
	docker exec -i -t webdev /bin/bash
show:
	open http://$(boot2docker ip 2>/dev/null):8080 



# PRODUCTION CONTAINER
runprod:
	docker run -d -p 8080:80   --name web   test-img-1
	docker ps

status:
	docker ps
	docker exec -i -t web /usr/bin/supervisorctl status

destroy:
	-docker stop web webdev
	-docker rm web webdev

debug:
	docker exec -i -t web /bin/bash



debug_last_image:
	docker run -t -i $$(docker images -q | head -n 1) /bin/bash


# remove snapshots of all stopped containers, remove all untagged images
clean:
	-docker ps -a -q | xargs docker rm
	-docker images -a | grep "^<none>" | awk '{print $$3}' | xargs docker rmi






