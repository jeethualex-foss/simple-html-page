FROM redhat/ubi10

USER root

# Install the application dependencies
RUN yum install httpd httpd-tools -y

# Copy in the source code
COPY src /var/www/html
RUN mkdir /deployments
COPY startup.sh /deployments
RUN chmod -Rf 777 /deployments

WORKDIR /deployments

# Setup an app user
# RUN useradd -ms /bin/bash  user101
# USER user101

EXPOSE 80

CMD ["sh","startup.sh"]