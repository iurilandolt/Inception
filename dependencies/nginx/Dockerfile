FROM debian:stable

RUN apt-get update && apt-get install -y nginx && apt install openssl -y

#COPY nginx.conf /etc/nginx/nginx.conf

COPY script.sh /

EXPOSE 80

RUN chmod +x script.sh

#CMD ["./script.sh"]
