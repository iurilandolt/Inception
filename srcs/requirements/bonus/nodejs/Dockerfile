FROM debian:bullseye

RUN apt-get update && apt install -y nodejs 

COPY ./conf/server.js /

CMD ["nodejs", "/server.js"]

# CMD ["tail", "-f", "/dev/null"]