FROM ubuntu:20.04
MAINTAINER meetparmar14790@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y tzdata apache2 zip unzip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download GitHub zip (you can rename it while downloading)
ADD https://codeload.github.com/themewagon/Oberlo/zip/refs/tags/v1.0.0 /var/www/html/Oberlo-1.0.0.zip


WORKDIR /var/www/html

RUN unzip Oberlo-1.0.0.zip && \
    cp -rvf Oberlo-1.0.0.zip/* . && \
    rm -rf Oberlo-1.0.0.zip

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
