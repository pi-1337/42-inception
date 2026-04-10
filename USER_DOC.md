# User Documentation

## Services :

This project consists of 3 services:
- Nginx is a webserver that serves content to the browser
- mariadb is a Database that has all users information and more
- wordpress is a bunch of PHP files that are the source code of the website

## Usage :

To start the services, run this command :

```bash
make
```

And to stop the services, run this command :

```bash
make stop
```
## Access :

To access the website, go to this link [https://ioulkhir.42.fr](https://ioulkhir.42.fr) **locally** in your machine.
*The link will not work other machines by default !*

To access the admin panel, you need to access this route `/wp-admin`, so the link would be [https://ioulkhir.42.fr/wp-admin](https://ioulkhir.42.fr/wp-admin) .
*Same for this link, it will not work other machines by default !*

## Credentials :

In the virtual machine, run this command in order to get the credentials
```bash
EMAIL=$(cat /home/ioulkhir/data/.env | grep WP_ADMIN_EMAIL | tr '=' '\n' | tail -n 1)
PASS=$(cat /home/ioulkhir/data/.env | grep WP_ADMIN_PASS | tr '=' '\n' | tail -n 1)
echo "\n=========\nThese are your credentials:\n\temail = $EMAIL\n\tpassword = $PASS\n=========\n"
```
The output is something like this:
```bash
=========
These are your credentials:
	email = <REDACTED>
	password = <REDACTED>
=========
```
## Debugging :

To check if the services are running, run this command:
```bash
docker ps
```

The output should be something like this :
```bash
CONTAINER ID   IMAGE             COMMAND                  CREATED        STATUS          PORTS                                                 NAMES
16e3aa42dd3a   nginx:jesus       "nginx -g 'daemon of…"   20 hours ago   Up 46 minutes   3000/tcp, 0.0.0.0:3000->443/tcp, [::]:3000->443/tcp   nginx
bd068b27f52f   wordpress:jesus   "/wp-install.bash"       20 hours ago   Up 46 minutes   9000/tcp                                              wordpress
c79d57e7d954   mariadb:jesus     "/tmp/db-init.bash"      20 hours ago   Up 46 minutes   3306/tcp                                              mariadb
```

If this looks messy to you, which really is.
Use this for a short and clear output :

```bash
docker ps -q
```

The output should be something like this :
```bash
16e3aa42dd3a
bd068b27f52f
c79d57e7d954
```

The result must be three *or more* hex-strings, these are the IDs of our services.