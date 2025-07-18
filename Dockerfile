FROM ubuntu:20.04
MAINTAINER meetparmar14790@gmail.com
 
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt update && \
    apt install -y tzdata apache2 zip unzip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
 
# Download GitHub zip (you can rename it while downloading)
ADD https://codeload.github.com/themewagon/furni/zip/refs/tags/v1.0.0 /var/www/html/furni-template.zip
 
WORKDIR /var/www/html
 
RUN unzip furni-template.zip && \
    cp -rvf furni-1.0.0/* . && \
    rm -rf furni-template.zip furni-1.0.0
 
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
