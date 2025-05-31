FROM redhat/ubi10-minimal

USER root

MAINTAINER Jeetu_Alex

# Install the application dependencies
RUN microdnf update -y
RUN microdnf install httpd httpd-tools -y

# Copy in the source code
RUN mkdir /deployments
COPY src /var/www/html
COPY startup.sh /deployments
RUN chmod -Rf 777 /deployments

WORKDIR /deployments

# Setup an app user
# RUN useradd -ms /bin/bash  user101
# USER user101

EXPOSE 80

CMD ["sh","startup.sh"]