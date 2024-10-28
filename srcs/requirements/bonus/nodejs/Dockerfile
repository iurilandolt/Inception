FROM debian:bullseye

RUN apt-get update && apt install nodejs -y

RUN apt-get install npm -y

# RUN npm install

# RUN npm install mime-types

COPY ./conf/server.js /

CMD ["nodejs", "/server.js"]

# CMD ["tail", "-f", "/dev/null"]