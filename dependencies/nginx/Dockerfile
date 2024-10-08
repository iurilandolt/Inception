FROM debian:stable

RUN apt-get update && apt-get install -y nginx && apt install openssl -y

#COPY nginx.conf /etc/nginx/nginx.conf

#COPY default /etc/nginx/sites-available/default

COPY script.sh /

RUN chmod +x script.sh

#CMD ["./script.sh"]
