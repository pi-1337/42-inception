FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN echo $'\n\n\n\n\n\n\n\n\n' | openssl req -x509 -nodes --out /etc/nginx/ssl/certificate.cert --keyout /etc/nginx/ssl/private.key

COPY ./helpers/default.nginx /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
