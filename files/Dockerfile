FROM debian:buster

EXPOSE 80 443

COPY builder/* ./

RUN bash dependencies.sh

CMD bash start.sh
