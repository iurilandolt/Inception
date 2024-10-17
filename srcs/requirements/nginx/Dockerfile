FROM debian:stable

RUN apt-get update && apt-get install -y nginx && apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/L=LISBOA/O=42/OU=student/CN=rlandolt"

COPY default /etc/nginx/sites-available/.

RUN rm /etc/nginx/sites-enabled/default

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN sed -i 's/ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
