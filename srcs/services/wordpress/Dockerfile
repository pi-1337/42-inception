FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install -y \
    wget \
    php \
    php8.2-fpm \
    php-mysqli

COPY ./helpers/wp-install.bash /wp-install.bash
RUN chmod +x /wp-install.bash

ENTRYPOINT ["/wp-install.bash"]
