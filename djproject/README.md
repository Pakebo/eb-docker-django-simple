
Django Project
==============

This is the root of the django project.

Individual pieces of functionality are sub folders here.

A module of the same name `djproject` contains all the settings.




Production deployment
---------------------

  - supervisord: ensures these run
    - `nginx`: listens to all hostanmes on port 80
    - gunicorn: connects (via WSGI) to 
      - django


Development deployment
----------------------

  - django's buildin runserver command



