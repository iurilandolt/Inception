## What is Docker? How is containerization different from virtualization?

# https://www.docker.com/resources/what-container/

Docker is an open-source platform that automates the deployment of applications inside portable containers. 
Containers package an application and its dependencies together, ensuring consistent behavior across environments.

# Containerization

Each container runs as an app in the OS kernel, sharing all it's resources and adjusting their destribution in real time. 
Containers are considerable more lightweight and less resource hungry since they are comprised of a limited number of apps and their dependencies.

# Virtualization 

Each virtual machine requires dedicated, usually pre-allocated, memory, storage and processing resources.
In most cases those resources are locked-in and dedicated to that virtualized machine and cannot be redestributed.
Virtual machines will often have slower start-up and operation times since they are running full OS's.

## How do docker images and contianers work?

Docker images are read-only templates that define the environment and application setup;
including dependencies, files, and configurations. 
They serve as the blueprint for creating containers.
Containers are created from images, they can have their own writable layer, which allows runtime read/write.

## What is a Dockerfile?

Docker can build images automatically by reading the instructions from a Dockerfile. 
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.

FROM: Specifies the base image.
RUN: Executes commands to install software and set up the environment during the image build.
COPY: Copies files or directories from the host into the image.
ADD: Similar to COPY but also supports URLs and automatic extraction of tar files.
CMD: Specifies the default command to run when the container starts (it can be overridden).
USER: 

These commands are run during the image build process.
The last command CMD / ENTRYPOINT determines the behavior when the container starts.

# https://docs.docker.com/reference/dockerfile/

## What is a daemon, PID1, and why does the entrypoint command have to be be a call to a service that runs in the foreground?

A daemon is a background process that runs continuously, waiting to handle requests or perform tasks without user intervention. 
In our case a web-server, a php engine and a database;

PID 1 refers to the first process started by the operating system during boot. 
In the context of containers, the command specified in the ENTRYPOINT or CMD is not necessarelly assigned PID 1. 

## What is Docker-Compose?

# https://docs.docker.com/compose/overview/

Docker Compose is a tool for defining and managing multi-container Docker applications. 
It uses a YAML file (usually named docker-compose.yml) to specify services, networks, and volumes needed for the application. 
With Docker Compose, you can start, stop, and manage all containers in an application with a single command.

## What is a docker network?

# https://docs.docker.com/engine/network/

A virtual network for container groups. 
Docker provides several types of networks:

bridge: default type. Containers on these networks can communicate using their container names or IP addresses.
host: Shares the host's networking stack. Containers share the host's IP.
overlay: Used for multi-host networking, enabling containers across different Docker hosts to communicate.
macvlan: Allows assigning a MAC address to a container, making it appear as a physical device on the network.

On our default network (bridged), uses a DNS service, allowing us to use the contianer name in configurations instead of it's ip adress.

## What are Docker Volumes?

# https://docs.docker.com/engine/storage/volumes/

While bind mounts are dependent on the directory structure and OS of the host machine, volumes are completely managed by Docker. 

Volumes are easier to back up or migrate than bind mounts.
You can manage volumes using Docker CLI commands or the Docker API.
Volumes work on both Linux and Windows containers.
Volumes can be more safely shared among multiple containers.
Volume drivers let you store volumes on remote hosts or cloud providers, encrypt the contents of volumes, or add other functionality.
New volumes can have their content pre-populated by a container.
Volumes on Docker Desktop have much higher performance than bind mounts from Mac and Windows hosts.

In addition, volumes are often a better choice than persisting data in a container's writable layer, because a volume doesn't increase the size of the containers using it, and the volume's contents exist outside the lifecycle of a given container.

## what are docker secrets?

# https://docs.docker.com/engine/swarm/secrets/

Docker Secrets are a secure way to manage sensitive data, such as passwords, API keys, and TLS certificates. Secrets are encrypted and only accessible to the services that need them, minimizing the risk of exposure.

Encryption: Secrets are encrypted at rest and in transit.
Scoped Access: Only services with explicit access to a secret can retrieve it.
Automatic Management: Secrets can be easily created, updated, and removed.
Secrets are not stored in images and are mounted into containers at runtime.

## What is the pertinence of this porject's structure?

The three services in our Docker project — Nginx, WordPress, and MariaDB —serve specific, technical purposes:

Nginx: Acts as a reverse proxy, forwarding incoming HTTP(S) requests to the WordPress container. It serves static content directly and manages SSL encryption for secure connections.

WordPress: Runs the application and relies on PHP-FPM (FastCGI Process Manager) to process PHP scripts. Nginx forwards dynamic requests (e.g., page loads) to WordPress, which then interacts with the MariaDB container to retrieve or store data.

MariaDB: Stores all WordPress data, such as posts, user credentials, and settings. WordPress connects to MariaDB to perform CRUD (Create, Read, Update, Delete) operations, ensuring data persistence and integrity.

Together, this architecture supports a scalable, maintainable, and efficient web application setup. Each service can be updated, scaled, or replaced independently as needed.


## What is Nginx?

# https://nginx.org/en/

NGINX is open-source web server software used for reverse proxy, load balancing, and caching. 
It provides HTTPS server capabilities and is mainly designed for maximum performance and stability. 
It also functions as a proxy server for email communications protocols, such as IMAP, POP3, and SMTP.

## How does a web-server and reverse proxy work in this particular setup?

# https://www.papertrail.com/solution/guides/nginx/

A web server is a computer system capable of delivering web content to end users over the internet via a web browser.
A reverse proxy is a server that sits in front of web servers and forwards client (e.g. web browser) requests to those web servers. 
Reverse proxies are typically implemented to help increase security, performance, and reliability.

## What is SSL encryption and SSL certificates, why do we need them?

SSL, or Secure Sockets Layer, is an encryption-based Internet security protocol. 
It was first developed for the purpose of ensuring privacy, authentication, and data integrity in Internet communications.
SSL encrypts data that is transmitted across the web.
SSL certificates include the following information in a single data file:
	The domain name. 
	Person, organization, or device it was issued to
	Which certificate authority issued it
	The certificate authority's digital signature
	Associated subdomains
	Issue date of the certificate
	Expiration date of the certificate
	Public key


## What is TLS encryption? why use only 1.2 and 1.3 encryption?

# https://www.cloudflare.com/learning/ssl/transport-layer-security-tls/

TLS evolved from SSL, Due to corporate history, the terms TLS and SSL are sometimes used interchangeably.
TLS 1.3 is the latest version of the TLS protocol. 
TLS 1.3 dropped support for older, less secure cryptographic features, and it sped up TLS handshakes, among other improvements.



## Hhat is wordpress and what is php-fpm ?

# https://cloud.google.com/appengine/docs/standard/php-gen2/runtime

php fast process management is a php runtime envrioment capable of executing php code and delivering php files to a web browser

## How do the nginx and php-services comunicate?

# # https://medium.com/@mgonzalezbaile/demystifying-nginx-and-php-fpm-for-php-developers-bba548dd38f9

An Nginx process communicates with a PHP-FPM process either through a TCP port or through a socket. 

## How does wordpress comunicate with the database?

# https://blog.hubspot.com/website/wordpress-database

The PHP scripting language is used to send and retrieve information from your MySQL database
WordPress uses PHP and the SQL query within the PHP markup to create, read, update, and delete data from the MySQL database.

## What is a database and why do we use it for a php website?

# https://jetpack.com/blog/wordpress-database/

A WordPress database is a storage of your website data that uses the MySQL database management system.
This holds information tables like, user credentials, posts, comments and other dynamic data.
A database is a crucial feature of a dynamic website allowing content to be created, edited or deleted by users and administrators.

## How to setup a mysql database?

# https://mariadb.com/kb/en/mariadb-command-line-client/

# https://docs.vultr.com/how-to-install-mariadb-on-debian-12

Our db setup e made using the mariadb cli and an option file to run mysql code ->

# https://mariadb.com/kb/en/create-database/
# https://mariadb.com/kb/en/create-user/
# https://mariadb.com/kb/en/grant/
# https://mariadb.com/kb/en/alter-user/
# https://mariadb.com/kb/en/flush/


## What is redis object cache?

# https://wp-rocket.me/wordpress-cache/redis-object-caching/

Object caching stores database query results that have been requested. Subsequently, it serves them up faster the next time a user requests them. 
This way, your database doesn’t have to be queried again and again.
This is particularly helpful if;
the website content is diferent for each user,
website recieves a lot of repeated queries
abundant number of users
you need to restrain resource usage on the server host machine

## What is ftp? why is it usefull in this setup?

# https://www.netguru.com/glossary/file-transfer-protocol

File Transfer Protocol is a standard network protocol used for the transfer of computer files between a client and server. 
users may authenticate themselves with a username and password, but can connect anonymously if the server is configured to allow it.
FTP plays a critical role in allowing developers to move files from their local environment to the live a server.


## What is adminer and why is it usefull in this setup?

# https://www.adminer.org/

Adminer (phpMinAdmin) is a full-featured database management tool written in PHP. it consist of a single file ready to deploy to the target server. 
Adminer is acessible trough the browser and is available for MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, Elasticsearch, MongoDB and others via plugin.

## What is netdata ?

# https://www.datadoghq.com/knowledge-center/network-monitoring/snmp-monitoring/

Netdata is a distributed real-time, health monitoring platform for systems, hardware, containers & applications that collects and displays data trought a browser gui.

# What is nodejs ?

# https://nodejs.org/en/learn/getting-started/introduction-to-nodejs

Like php/php-fpm, nodejs is a runtime server but for javascript.
our nginx setup has a separate proxy server pointing to this runstime envrioment so it can serve us the js files we request trought the browser.
