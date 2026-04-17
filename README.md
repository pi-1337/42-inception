This project has been created as part of the 42 curriculum by ioulkhir.
# Description :
This project is related to **System Administration**, It is about setting up a **containerized** web application using `docker` and `compose`, Solving the "*it works on my machine*" problem.
# Instructions
To compile the project, use the command below :
```bash
make
```
More details are provided in [User Documentation](./USER_DOC.md) and [Developer Documentation](./DEV_DOC.md).
# Resources
Throughout the project i have read a lot of documentation about Docker, these are a few :
- Docker deep dive by **nigel poulton**
- Docker: https://youtu.be/PrusdhS2lmo
- https://www.baeldung.com/linux/cgroups-and-namespaces
- namespaces & control groups: https://youtu.be/x1npPrzyKfs
- Docker Networking Tutorial: https://youtu.be/fBRgw5dyBd4
# Project Description
In this project, Docker is used to containerize our application. In other words making it work on any other machine with docker in it.
The idea is to build an image that anyone can run as a container, therefore have access to our application without any debugging overhead.
#### a - Virtual Machines vs Docker :
VMs and containers have the same kind of relationship between process and threads, meaning that containers are light-weight VMs.
If *VM = kernel_mode + user_mode* then *container = user_mode*, this is what makes containers cheap and light-weight. And if a container needs kernel mode, then it uses the host's kernel.
#### b - Secrets vs Environment Variables
We use both to store sensitive data, but one is more secure than the other and that is Docker Secrets.
The thing is that a process's env is visible in the file ``/proc/<pid>/environ`` which makes it easily accessible, or by using ``docker inspect container``. Whereas Docker secrets are stored in the container itself, so it is much harder to accidentally leak sensitive information.
#### c - Docker Network vs Host Network
Docker networks have different types or **driver**s, a few of the drivers are *bridge* and *host* :
- **Bridge**: the default driver, allows containers to communicate on an internal network via the host machine. It is isolated using network namespace.
- **Host**: containers have direct access to the host's network, giving more performance but lack of isolation.
#### d - Docker Volumes vs Bind Mounts
Docker volumes are called *named volumes* whereas *bind mounts* are another type of volumes:
- **Named volumes**: handled completely by Docker (you cannot change the mount points).
- **Bind mounts**: handled by Docker but not completely (you can specify the mount points).

*(A simple analogy is that of C and Rust, C gives you more control and freedom and that is not very safe, however Rust gives more constraints and rules which provides more safety.)*
