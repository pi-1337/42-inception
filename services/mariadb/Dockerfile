FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install -y mariadb-server

COPY ./helpers/db-init.bash /tmp/db-init.bash
RUN chmod +x /tmp/db-init.bash

ENTRYPOINT ["/tmp/db-init.bash"]
