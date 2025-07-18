FROM ubuntu:20.04
MAINTAINER meetparmar14790@gmail.com
 
ENV DEBIAN_FRONTEND=noninteractive
 
# Install dependencies
RUN apt update && \
    apt install -y tzdata apache2 zip unzip wget && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
 
# Download Furni template and rename
ADD https://codeload.github.com/themewagon/DashboardKit/zip/refs/tags/v1.0.0 /var/www/html/DashboardKit.zip
 
WORKDIR /var/www/html
 
# Unzip and set up the project
RUN unzip DashboardKit.zip && \
    cp -rvf DashboardKit-v1.0.0/* . && \
    rm -rf DashboardKit.zip DashboardKit-v1.0.0
 
# Expose Apache port and run
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
