# Developer Documentation
## Environment :
### Environment Variables :
To get the `.env` file that contains the environment variables, run this command that copies it from another location on the virtual machine :
```bash
cp /home/ioulkhir/.env ./srcs/.env
```
### DNS Resolution :
We are using this domain in our project `ioulkhir.42.fr`, even though we do not actually have access to the sub-domain. Now don't worry, this is not a 0-day.
We are just tricking our machine to think we do have access to that sub-domain, this is how it is done on Kali Linux:
```bash
vim /etc/hosts
```
It looks something like this :
```bash
# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1   localhost
127.0.1.1   linuxize.desktop linuxize

# Custom entries
192.168.1.10   server.example.com server
::1             localhost ip6-localhost ip6-loopback
```
Now just like `localhost` is working for us just fine without us needing to buy a domain name called `localhost`, we do the same for `ioulkhir.42.fr` :
Before the localhost resolution line, add another line pointing to **127.0.0.1** :
```bash
# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1   ioulkhir.42.fr
127.0.0.1   localhost
# leave the rest as is
...
```
## Launch :
That's all you need to configure, now to actually run the project use either our `Makefile` or docker compose :
```bash
make # this calls docker compose to start the services
```
Docker compose directly :
```bash
docker compose up # builds images and runs containers
```
## Containers & Volumes Management :
This is how you manage containers :
```bash
$ docker ps # list containers
$ docker rm <CONTAINER_ID> # remove container if not running
$ docker rm --force <CONTAINER_ID> # remove container even if running
$ docker stop <CONTAINER_ID> # stop container
$ docker start <CONTAINER_ID> # start container
$ docker exec <CONTAINER_ID> ls # runs command ls on the container
```
And for volumes :
```bash
$ docker volume ls # list volumes
$ docker volume rm <VOLUME_NAME> # remove volume if not used
$ docker volume prune # remove all unused volumes
```
## Persistent Storage :
Now because we are using volumes for storing our **wordpress** files and **mariadb** data, and since volumes have a different life-cycle than that of containers. This means even when containers are stopped or even removed the data is still persistent.

This is because using volumes is like mounting a directory inside the container to a directory in the virtual machine, if we go to `/home/ioulkhir/data/wp` for example, we are going to find this :
```bash
$ ls /home/ioulkhir/data/wp 
index.php	      	  wp-config.php	        wp-login.php
license.txt	      	  wp-config-sample.php  wp-mail.php
readme.html	      	  wp-content	        wp-settings.php
wp-activate.php       wp-cron.php	   	    wp-signup.php
wp-admin	      	  wp-includes	        wp-trackback.php
wp-blog-header.php    wp-links-opml.php     xmlrpc.php
wp-comments-post.php  wp-load.php
```
If you look closely, this is the same collection of files you find in a wordpress project, it did not exist there before running the containers, this is because this directory is *mounted* to `/var/www/wordpress` inside the container, any changes on one directory changes the other (that's what mounted means).
