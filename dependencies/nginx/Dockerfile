FROM debian:stable

RUN apt-get update && apt-get install -y nginx && apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/L=LISBOA/O=42/OU=student/CN=rlandolt"

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
