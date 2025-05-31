FROM redhat/ubi10
WORKDIR /

# Install the application dependencies
RUN yum install httpd httpd-tools -y

# Copy in the source code
COPY src /var/www/html
RUN mkdir /deployments
COPY startup.sh /deployments
EXPOSE 80

WORKDIR /deployments
RUN ls -ltr /deployments
# Setup an app user
# USER 1001
#
# CMD ["sh","startup.sh"]

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]