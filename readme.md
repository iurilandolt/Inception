## What is Docker? How is containerization different from virtualization?

# https://www.docker.com/resources/what-container/

Docker is an open-source platform that automates the deployment of applications inside portable containers. Containers package an application and its dependencies together, ensuring consistent behavior across environments.

# Containerization

Each container runs as an app in the OS kernel, sharing all it's resources and adjusting their destribution in real time. Containers are considerable more lightweight and less resource hungry since they are comprised of a limited number of apps and their dependencies.

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

Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.

FROM: Specifies the base image.
RUN: Executes commands to install software and set up the environment during the image build.
COPY: Copies files or directories from the host into the image.
ADD: Similar to COPY but also supports URLs and automatic extraction of tar files.
CMD: Specifies the default command to run when the container starts (it can be overridden).

These commands are run during the image build process.
The last command CMD / ENTRYPOINT determines the behavior when the container starts.

# https://docs.docker.com/reference/dockerfile/

## What is a daemon, PID1, and why does the entrypoint command have to be be a call to a service that runs in the foreground?

A daemon is a background process that runs continuously, waiting to handle requests or perform tasks without user intervention. A our case a web-server, a php engine and a database;

PID 1 refers to the first process started by the operating system during boot. 
In the context of containers, the command specified in the ENTRYPOINT or CMD is typically assigned PID 1. 

## What is Docker-Compose?

# https://docs.docker.com/compose/overview/

Docker Compose is a tool for defining and managing multi-container Docker applications. It uses a YAML file (usually named docker-compose.yml) to specify services, networks, and volumes needed for the application. With Docker Compose, you can start, stop, and manage all containers in an application with a single command.

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



What is Nginx?

How does a web-server and reverse proxy work in this particular setup?

What is SSL encryption and SSL certificates, why do we need them?

What is TLS encryption? why use only 1.2 and 1.3 encryption?

What is the difference beetween a self signed certificate and a valid one?

what is wordpress and what is php-fpm ?

how do the nginx and php-services comunicate?

how does php-fpm comunicate with the database?

what is a database and why do we use it for a php website?

what is redis? how does php-fpm interact with the redis-server diffrently than it does with the database?

what is ftp? why is it usefull in this setup?

what is adminer and why is it usefull in this setup?